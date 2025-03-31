contract Test {
    flag: Int = 0;

    // Receiver for specific text message "hello"
    receive("hello") {
        self.flag = 1;
    }

    // Receiver for arbitrary text messages
    receive(msg: String) {
        self.flag = 2;
    }

    // Dummy function to read flag value
    get fun getFlag(): Int {
        return self.flag;
    }
}
