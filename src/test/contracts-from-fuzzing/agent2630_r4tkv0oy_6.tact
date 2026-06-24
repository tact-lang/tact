struct BigOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract BigOptionalFields {
    field: BigOptional;

    init() {
        self.field = BigOptional{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "hi"
        };
    }
}