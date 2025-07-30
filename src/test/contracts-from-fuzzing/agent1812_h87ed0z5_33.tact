contract ZeroDefaults {
    foo: Int as uint8 = 0;
    bar: Int as uint4 = 0;

    init() {
        self.foo = 255; // too large, triggers range check at end
        self.bar = 31; // too large
        self.foo = 10; // ok
        self.bar = 5; // ok
    }
}