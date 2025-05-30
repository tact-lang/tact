message MyMsg {
    value: Int;
}

contract UnderscoreReceiver {
    x: Int = 0;

    // Receiver using underscore to discard incoming MyMsg
    receive(_: MyMsg) {
        self.x = 7;
    }
}
