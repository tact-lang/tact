contract DefaultsAndInit {
    foo: Int = 100;
    bar: Bool;

    init() {
        self.bar = true;
        self.foo = 200;
    }
}
