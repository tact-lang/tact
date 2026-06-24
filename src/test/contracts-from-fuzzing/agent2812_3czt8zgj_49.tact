struct BigOptional {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Bool?;
}

contract AllBigOpts {
    s: BigOptional;

    init() {
        self.s = BigOptional{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}