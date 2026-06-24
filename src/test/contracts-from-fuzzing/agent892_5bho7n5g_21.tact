struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract MultiOpt {
    sOpt: S?;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;

    init() {
        self.sOpt = S{a:1,b:true,c:"hi",d:null,e:false};
        self.intOpt = 42;
        self.boolOpt = null;
        self.strOpt = "ok";
    }
}