contract TestOverlap {
    var: Int = 0;
    receive("comment") {
        self.var = 100;
    }
    receive(str: String) {
        self.var = 200;
    }
}
