struct ManyBoolOpts {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
}

contract OptBoolsWrap {
    bs: ManyBoolOpts;
    init() {
        self.bs = ManyBoolOpts{a:null,b:null,c:null,d:null,e:null,f:null};
    }
}
