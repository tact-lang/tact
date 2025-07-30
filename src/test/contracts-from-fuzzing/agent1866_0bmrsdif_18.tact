struct S {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract OptMix {
    v: S;

    init() {
        self.v = S{
            a:null,
            b:true,
            c:null,
            d:1,
            e:false,
            f:"z",
        };
    }
}