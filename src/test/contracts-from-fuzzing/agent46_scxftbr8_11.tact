contract UnusedGetter {
    v: Int = 77;

    receive() {}

    // Getter that is never used anywhere
    get fun unusedGetter(): Int {
        return self.v;
    }
}
