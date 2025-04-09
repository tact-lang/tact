struct OptionalInside {
    a: Int;
    b: Bool?;
}

contract StructWithOptionalInside {
    s: OptionalInside;

    init() {
        self.s = OptionalInside{ a: 5, b: null };
    }
}