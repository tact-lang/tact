struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract OptionalFields {
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
            h: null,
            i: null,
            j: null,
        };
    }
}