contract Test3 {
    v: Int = 5;

    receive() {}

    // Getter declared but never used
    get fun unusedGetter(): Int {
        return self.v;
    }
}
