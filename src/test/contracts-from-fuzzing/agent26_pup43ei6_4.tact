struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Builder?;
    g: Slice?;
}

contract Test4 {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}