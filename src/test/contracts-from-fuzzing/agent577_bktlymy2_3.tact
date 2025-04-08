struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalFields {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}
