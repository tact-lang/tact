struct BigOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract ManyBigOpt {
    opt: BigOpt;

    init() {
        self.opt = BigOpt{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null
        };
    }
}