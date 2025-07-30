struct Medium {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MultipleStructFields {
    s1: Medium;
    s2: Medium;
    s3: Medium;
    init() {
        self.s1 = Medium{a:1,b:true,c:"x",d:null,e:null,f:null};
        self.s2 = Medium{a:2,b:false,c:"y",d:null,e:null,f:null};
        self.s3 = Medium{a:3,b:true,c:"z",d:null,e:null,f:null};
    }
}