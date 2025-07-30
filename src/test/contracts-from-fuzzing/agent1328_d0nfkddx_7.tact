struct S1 {
    a: Int;
    b: Int?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: String?;
}

contract OptionalFields {
    data: S1;
    init() {
        self.data = S1{
            a: 100,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}