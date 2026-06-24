struct OptionalDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract Test {
    od: OptionalDeep;

    init() {
        self.od = OptionalDeep{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}