struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract OptsPersist {
    opts: BigOptional;
    init() {
        self.opts = BigOptional{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: null,
        };
    }
}