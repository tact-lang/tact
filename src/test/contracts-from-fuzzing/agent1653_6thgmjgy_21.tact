struct ComplexInner {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool;
    f: String;
}

struct ComplexMid {
    ci: ComplexInner;
    flag: Bool?;
    txt: String;
}

contract TestContract {
    x1: ComplexMid;
    x2: ComplexMid;
    x3: ComplexMid;
    x4: ComplexMid;

    init() {
        let cm = ComplexMid{
            ci: ComplexInner{a:null,b:true,c:"c",d:7,e:false,f:"f"},
            flag:null,
            txt:"hi"
        };
        self.x1 = cm;
        self.x2 = cm;
        self.x3 = cm;
        self.x4 = cm;
    }
}