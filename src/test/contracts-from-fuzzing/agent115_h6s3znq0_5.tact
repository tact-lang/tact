contract TestStringReceiver {
    last: Int = 0;

    receive(str: String) {
        // For testing, simply set last to a constant value.
        self.last = 123;
    }
}
