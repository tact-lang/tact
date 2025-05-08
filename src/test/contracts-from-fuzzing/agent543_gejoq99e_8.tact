struct BigOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract BigOptionalFields {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
