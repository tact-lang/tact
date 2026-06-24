struct S {
    a: Int;
    b: Bool;
}

contract StructFieldWithDefaults {
    s: S = S{ a: 7, b: true };

    init() {
        self.s = S{ a: 42, b: false };
    }
}