struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int?;
    h: Bool?;
}

contract TestOptional {
    opt: ManyOptional;

    init() {
        self.opt = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
        };
    }
}
