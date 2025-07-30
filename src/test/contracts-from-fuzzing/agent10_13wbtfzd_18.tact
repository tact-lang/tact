contract InitOverrides {
    foo: Int = 1;
    bar: Int;

    init() {
        self.foo = 100;
        self.bar = 200;
    }
}