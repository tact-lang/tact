struct ManyNulls {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract NullFields {
    data: ManyNulls;

    init() {
        self.data = ManyNulls{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
        };
    }
}
