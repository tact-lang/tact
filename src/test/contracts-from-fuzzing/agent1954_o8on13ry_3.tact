struct IntOptals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
}

contract ManyOptionals {
    opts: IntOptals;

    init() {
        self.opts = IntOptals{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
            f: null,
            g: 7,
        };
    }
}
