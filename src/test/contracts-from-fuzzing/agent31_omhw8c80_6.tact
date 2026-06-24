message MyMsg {
    value: Int;
}

contract Test {
    counter: Int = 0;

    // Receiver for typed binary message: MyMsg
    receive(msg: MyMsg) {
        self.counter = self.counter + msg.value;
    }

    // Fallback: receiver for any binary message.
    receive(msg: Slice) {
        // do nothing
    }
}
