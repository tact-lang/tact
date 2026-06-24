struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyOpts {
    opts: ManyOptional;

    init() {
        self.opts = ManyOptional{
            a:null, b:null, c:null,
            d:null, e:null, f:null
        };
    }
}
