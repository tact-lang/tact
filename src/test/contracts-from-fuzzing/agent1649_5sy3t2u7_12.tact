struct S {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedOptional {
    s1: S;
    s2: S?;
    s3: S?;

    init() {
        self.s1 = S{a:1,b:"b",c:true,d:null,e:null,f:null};
        self.s2 = null;
        self.s3 = null;
    }
}