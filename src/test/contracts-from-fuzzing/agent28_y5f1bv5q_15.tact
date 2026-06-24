struct OptRec {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract Test {
    rec: OptRec;

    init() {
        self.rec = OptRec{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}