contract DefaultsVsInit {
    foo: Int = 1;
    bar: Int;

    init() {
        self.bar = 2;
        self.foo = 42;
    }
}