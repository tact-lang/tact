struct MultiDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "foo";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract BigDefaults {
    s1: MultiDefault;
    s2: MultiDefault;

    init() {
        self.s1 = MultiDefault{ a:1,b:false,c:"x",d:null,e:null,f:null };
        self.s2 = MultiDefault{ a:2,b:true,c:"y",d:7,e:true,f:"abc" };
    }
}