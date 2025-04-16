contract DefaultsAndOverrides {
    foo: Int = 5;
    bar: String = "hello";
    baz: Bool;

    init() {
        self.foo = 10; // override
        self.bar = "world"; // override
        self.baz = true; // initialize
    }
}