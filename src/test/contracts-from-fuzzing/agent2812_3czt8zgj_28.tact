struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract AllOpts {
    s: OnlyOptionals;

    init() {
        self.s = OnlyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}