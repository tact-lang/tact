struct Sss {
    a: Int?;
    b: Bool?;
    c: Slice?;
}

contract ComplexOpts {
    opt: Sss? = null;

    init() {
        self.opt = Sss{
            a: 1,
            b: null,
            c: null
        };
    }
}