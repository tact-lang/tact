struct S {
    a: Int;
    b: Bool;
    c: String?;
}

contract ManyStructs {
    s1: S;
    s2: S?;
    s3: S;
    s4: S?;

    init() {
        self.s1 = S{a: 1, b:true, c:null};
        self.s2 = null;
        self.s3 = S{a:2,b:false,c:"yes"};
        self.s4 = S{a:3,b:true,c:null};
    }
}