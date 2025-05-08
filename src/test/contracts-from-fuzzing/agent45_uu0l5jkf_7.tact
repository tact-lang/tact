message MyMsg {
    value: Int;
}

contract TypedReceiver {
    x: Int = 0;

    // This receiver function is triggered for binary messages of type MyMsg
    receive(msg: MyMsg) {
        self.x = msg.value;
    }
}
