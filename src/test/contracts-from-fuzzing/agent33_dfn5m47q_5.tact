struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
}

contract Test {
    optVals: Opts;

    init() {
        self.optVals = Opts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}