struct Data {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: Bool?;
    f: Address?;
    g: Cell?;
}

contract OptFields {
    field: Data;

    init() {
        self.field = Data{
            a: null,
            b: 1,
            c: null,
            d: null,
            e: true,
            f: null,
            g: null
        };
    }
}