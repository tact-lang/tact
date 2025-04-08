contract DefaultsVsInit {
    foo: Int = 5;
    bar: Bool = false;

    init() {
        self.foo = 42;
        self.bar = true;
    }
}