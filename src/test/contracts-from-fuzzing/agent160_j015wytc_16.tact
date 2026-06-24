struct S {
    a: Int;
    b: Bool;
}

contract MultArray {
    s0: S;
    s1: S;
    s2: S;
    s3: S;
    init() {
        self.s0=S{a:1,b:true};
        self.s1=S{a:2,b:true};
        self.s2=S{a:3,b:true};
        self.s3=S{a:4,b:false};
    }
}