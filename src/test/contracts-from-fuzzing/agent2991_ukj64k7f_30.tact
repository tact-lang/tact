struct SOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test {
    fld: SOpt;

    init() {
        self.fld = SOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}