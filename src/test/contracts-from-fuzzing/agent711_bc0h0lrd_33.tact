struct SBigOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyOpts {
    s: SBigOpt;

    init() {
        self.s = SBigOpt{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}
