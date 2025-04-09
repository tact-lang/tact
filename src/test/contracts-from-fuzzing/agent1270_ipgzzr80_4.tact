struct OptionalNested {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{
            a: null,
            b: true,
            s: null
        };
    }
}