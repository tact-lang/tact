contract RangeCheck {
    foo: Int as uint8;

    init() {
        self.foo = -10; // way out of uint8
        self.foo = 1234; // again out of uint8
        self.foo = 200; // valid final value; no compile error expected
    }
}