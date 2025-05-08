struct SOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test13 {
    st: SOpt;
    init() {
        self.st = SOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}