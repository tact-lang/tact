struct Pack {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Collection {
    p1: Pack;
    p2: Pack;
    p3: Pack;

    init() {
        self.p1 = Pack{a:1,b:true,c:"x",d:null,e:null,f:null};
        self.p2 = Pack{a:2,b:false,c:"y",d:null,e:null,f:null};
        self.p3 = Pack{a:3,b:true,c:"z",d:null,e:null,f:null};
    }
}