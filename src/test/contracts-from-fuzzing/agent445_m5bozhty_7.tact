struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract ManyStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
    init() {
        self.s1 = S{a:1,b:"a",c:true};
        self.s2 = S{a:2,b:"b",c:false};
        self.s3 = S{a:3,b:"c",c:true};
        self.s4 = S{a:4,b:"d",c:false};
        self.s5 = S{a:5,b:"e",c:true};
    }
}