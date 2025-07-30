contract TestTextReceiver {
    var: Int = 0;
    receive("text") {
        self.var = 10;
    }
}
