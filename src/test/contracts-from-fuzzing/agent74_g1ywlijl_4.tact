contract TestStringReceiver {
    last: String = "";

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.last = str;
    }
}
