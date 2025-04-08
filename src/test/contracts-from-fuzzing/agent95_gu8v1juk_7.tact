struct Opts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract TestContract {
    flags: Opts;

    init() {
        self.flags = Opts{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
            f: null,
            g: 7,
            h: null
        };
    }
}