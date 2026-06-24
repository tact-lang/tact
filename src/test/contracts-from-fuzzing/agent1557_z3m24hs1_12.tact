contract DefaultsAndInit {
    foo: Int = 5;
    bar: Bool = false;
    baz: String = "hello";

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = "world";
    }
}