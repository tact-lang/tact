contract ContradictOptional {
    a: Int? = null;
    b: Int; // mandatory

    init() {
        self.b = 42;
    }
}