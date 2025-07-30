message MyPayload {
    a: Int;
}

contract TestUnderscoreReceiver {
    flag: Int = 0;

    // Receiver with underscore parameter to discard the incoming message
    receive(_: MyPayload) {
        self.flag = 100;
    }
}
