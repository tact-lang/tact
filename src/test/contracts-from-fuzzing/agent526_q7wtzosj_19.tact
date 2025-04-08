struct X {
    a: Int;
    b: String?;
}

contract StructWithOptionalDefault {
    s: X;

    init() {
        self.s = X{
            a: 42,
            b: null,
        };
    }
}
