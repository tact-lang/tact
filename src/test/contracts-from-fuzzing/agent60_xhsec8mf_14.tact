contract TestAmbiguous {
    flag: Int = 0;

    // Receiver for specific text message "hello"
    receive("hello") {
        self.flag = 1;
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.flag = 2;
    }

    // Fallback receiver for binary messages
    receive(msg: Slice) {
        self.flag = 3;
    }

    get fun trigger(): Int {
        return self.flag;
    }
}
