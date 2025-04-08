struct S {
    a: Int;
    b: Bool;
    c: Int?;
}

contract HasOptionals {
    s1: S;
    s2: S;
    intOpt: Int?;
    boolOpt: Bool?;
    
    init() {
        self.s1 = S{ a:1,b:true,c:null };
        self.s2 = S{ a:2,b:false,c:null };
        self.intOpt = null;
        self.boolOpt = null;
    }
}
