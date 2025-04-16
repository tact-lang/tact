struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}