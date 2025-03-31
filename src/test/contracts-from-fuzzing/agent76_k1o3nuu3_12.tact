contract UnusedGetter {
    v: Int = 100;

    // Getter declared but never explicitly used
    get fun unused(): Int {
        return self.v;
    }

    receive () {}
}
