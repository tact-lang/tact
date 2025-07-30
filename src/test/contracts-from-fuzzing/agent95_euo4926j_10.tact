contract TestOverlapping {
    flag1: Bool = false;
    flag2: Bool = false;

    // Receiver for specific text "hello"
    receive("hello") {
        self.flag1 = true;
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.flag2 = true;
    }
}
