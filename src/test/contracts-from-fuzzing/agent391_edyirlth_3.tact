struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
}

contract TestOpt {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a: null,
            b: "abc",
            c: true,
            d: 42,
            e: null
        };
    }
}