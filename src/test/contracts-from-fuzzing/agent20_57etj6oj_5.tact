contract TestGetter {
    v: Int = 0;

    // Getter that modifies state and returns the new value
    get fun getVal(): Int {
        self.v += 1;
        return self.v
    }

    receive () {}
}
