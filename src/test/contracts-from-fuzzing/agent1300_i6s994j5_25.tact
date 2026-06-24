struct Nested {
    a: Int as uint4;
    b: Bool;
}

contract ComplexNonNull {
    s: Nested?;

    init() {
        self.s = Nested{ a: 3, b: true };
    }
}