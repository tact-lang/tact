struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestContract {
    opts: ManyOptional;

    init() {
        self.opts = ManyOptional{
            a: null,
            b: null,
            c: 3,
            d: 4,
            e: null,
        };
    }

    receive() {
        let _ = self.opts.a;
        let _ = self.opts.c;
        let _ = self.opts.e;
    }
}