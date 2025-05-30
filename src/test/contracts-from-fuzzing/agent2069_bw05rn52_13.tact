struct MidDefaults {
    a: Int;
    b: Int = 42;
    c: Bool;
}

contract DefaultsInMiddle {
    foo: MidDefaults;

    init() {
        self.foo = MidDefaults{
            a: 1,
            c: true
        };
    }
}