message MyMsg {
    value: Int;
}

contract Test {
    counter: Int = 0;

    // Receiver for typed binary messages using an unused parameter
    // Using underscore to discard the incoming message
    receive(_: MyMsg) {
        self.counter = self.counter + 1;
    }
}
