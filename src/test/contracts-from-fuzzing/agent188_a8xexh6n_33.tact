struct B {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}
contract BigStruct {
    s1: B;
    s2: B;
    s3: B;

    init() {
        self.s1 = B{a:1,b:true,c:"a",d:null,e:false,f:null};
        self.s2 = B{a:2,b:false,c:"b",d:3,e:null,f:"hi"};
        self.s3 = B{a:4,b:true,c:"c",d:5,e:true,f:"ho"};
    }
}