struct OptionalComplex {
    ai: Int?;
    as_: String?;
    ab: Bool?;
}

contract OptComplexTest {
    field: OptionalComplex;

    init() {
        self.field = OptionalComplex{
            ai: 123,
            as_: "hi",
            ab: false,
        };
    }
}