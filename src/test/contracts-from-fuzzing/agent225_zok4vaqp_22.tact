contract OptionalMistakes {
    foo: Int?;

    init() {
        self.foo = 999;
        self.foo = null; // assign null after int assignment
    }
}