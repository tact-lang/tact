struct OptionalOnly {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract AllOptionalFields {
    data: OptionalOnly;
    init() {
        self.data = OptionalOnly{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}