contract TestFallback {
    var: Int = 0;
    receive(msg: Slice) {
        self.var = 99;
    }
}
