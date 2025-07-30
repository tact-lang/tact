struct OptionalMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract AllOptional {
    data: OptionalMany;

    init() {
        self.data = OptionalMany{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}