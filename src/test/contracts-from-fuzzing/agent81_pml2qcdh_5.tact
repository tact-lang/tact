struct OptionalNested {
    s: String?;
    b: Bool?;
    n: Int?;
}

contract Test {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{
            s: null,
            b: true,
            n: 123
        };
    }
}
