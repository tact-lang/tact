struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Cell?;
    g: Slice?;
    h: Address?;
}

contract OptionalFields {
    data: ManyOptional;
    init() {
        self.data = ManyOptional {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}
