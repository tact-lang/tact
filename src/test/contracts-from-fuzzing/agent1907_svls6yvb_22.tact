contract OptionalAndDefaultConflict {
    foo: Int? = null;

    init() {
        self.foo = null;
    }
}