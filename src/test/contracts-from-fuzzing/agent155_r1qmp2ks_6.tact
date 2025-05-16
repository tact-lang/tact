contract TestStringReceiver {
    var: Int = 0;
    receive(str: String) {
        self.var = 123;
    }
}
