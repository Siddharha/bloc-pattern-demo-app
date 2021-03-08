import 'dart:async';

class CounterBlock {
  var counter = 0;
  // ignore: close_sinks
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;


  // ignore: close_sinks
  final _eventStreamController = StreamController<EventActions>();
  StreamSink<EventActions> get eventCounterSink => _eventStreamController.sink;
  Stream<EventActions> get eventCounterStream => _eventStreamController.stream;


  CounterBlock(){
    eventCounterStream.listen((event) { 
      switch (event) {
        case EventActions.INCREMENT:
          counter++;
          break;
        case EventActions.DECREMENT:
          counter--;
          break;
        default:
      }

      counterSink.add(counter);
    });


  }
}

enum EventActions {INCREMENT,DECREMENT}