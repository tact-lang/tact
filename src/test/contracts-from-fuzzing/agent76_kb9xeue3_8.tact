struct P {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Test {
    p: P;

    init() {
        self.p = P{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
