struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test4 {
    val: OptionalFields;

    init() {
        self.val = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}