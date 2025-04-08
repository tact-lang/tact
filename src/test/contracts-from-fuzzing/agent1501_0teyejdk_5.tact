struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
}

contract OptionalStruct {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}