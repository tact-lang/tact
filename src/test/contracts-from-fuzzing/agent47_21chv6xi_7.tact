struct Combine {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalStructs {
    d1: Combine;
    d2: Combine?;

    init() {
        self.d1 = Combine{a:1,b:true,c:"ok",d:null,e:false,f:null};
        self.d2 = null;
    }
}