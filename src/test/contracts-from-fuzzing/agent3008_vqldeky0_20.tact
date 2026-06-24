struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MultiStruct {
    f1: S1;
    f2: S2;

    init() {
        self.f1 = S1{a:1,b:true,c:"x"};
        self.f2 = S2{d:null,e:null,f:null};
    }
}