contract Test {
    foo: Int;
    bar: Int = 3;

    init() {
        self.foo = self.bar + 5;
    }
}