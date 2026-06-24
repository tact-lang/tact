contract DefaultsAndExplicitInit {
    foo: Int = 10;
    bar: Bool = false;

    init() {
        self.foo = 42;
        self.bar = true;
    }
}