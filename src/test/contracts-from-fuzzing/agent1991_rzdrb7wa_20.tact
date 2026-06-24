contract UninitializedField {
    foo: Int;

    init() {
        self.foo = 42;
    }
}