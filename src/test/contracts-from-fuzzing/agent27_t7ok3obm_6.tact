struct OptionalsStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract OptionalFields {
    storage: OptionalsStruct;

    init() {
        self.storage = OptionalsStruct{
            a: null,
            b: true,
            c: null,
            d: "string",
            e: null,
            f: null
        };
    }
}
