contract Test2 {
    msg: String = "";

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.msg = str;
    }
}
