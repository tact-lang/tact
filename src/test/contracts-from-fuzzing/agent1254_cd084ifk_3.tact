struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptContract {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}