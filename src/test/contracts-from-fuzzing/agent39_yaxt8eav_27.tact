contract FieldShadow {
    foo: Int = 1;
    bar: Int;

    init() {
        self.bar = self.foo + 1;
    }
}