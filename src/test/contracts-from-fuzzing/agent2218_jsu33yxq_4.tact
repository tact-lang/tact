struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test {
    data: OptionalFields;
    init() {
        self.data = OptionalFields{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "hello"
        };
    }
}