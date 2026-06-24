struct OptNested {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract OptFields {
    data: OptNested;

    init() {
        self.data = OptNested{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}