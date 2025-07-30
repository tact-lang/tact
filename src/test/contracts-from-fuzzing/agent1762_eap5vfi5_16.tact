contract DefaultAndInit {
    foo: Int = 1;
    bar: Int;
    init() {
        self.foo = 42;
        self.bar = 100;
    }
}