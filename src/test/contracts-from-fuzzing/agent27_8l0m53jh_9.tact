contract Test6 {
    v: Int = 100;
    receive() {}

    // Getter declared but never used
    get fun unusedGetter(): Int {
        return self.v;
    }
}
