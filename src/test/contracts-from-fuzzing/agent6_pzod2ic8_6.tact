struct ComplexOptionals {
    ai: Int?;
    ab: Bool?;
    as_: String?;
}

contract StructWithOptionals {
    co: ComplexOptionals;

    init() {
        self.co = ComplexOptionals{
            ai: 1,
            ab: null,
            as_: "hi",
        };
    }
}