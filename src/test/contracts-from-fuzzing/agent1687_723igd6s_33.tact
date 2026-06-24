struct IntBool {
    a: Int;
    b: Bool;
}

contract StructDefaults {
    foo: IntBool = IntBool{ a: 10, b: false };
    bar: IntBool = IntBool{ a: 42, b: true };

    init() {
        self.foo = IntBool{ a: 0, b: false };
        self.bar = IntBool{ a: 100, b: false };
    }
}