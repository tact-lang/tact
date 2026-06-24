contract TestUnused {
    v: Int = 100;

    receive() {}

    // Getter declared but never used
    get fun unused_getter(): Int {
        return self.v;
    }
}
