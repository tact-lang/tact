struct Alternating {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
}
contract AltFields {
    f1: Alternating;
    init() {
        self.f1 = Alternating{a:1,b:true,c:null,d:null,e:2,f:false,g:null,h:null,i:3,j:true};
    }
    receive() {
        self.f1 = Alternating{a:4,b:false,c:5,d:true,e:6,f:true,g:7,h:false,i:8,j:false};
    }
}