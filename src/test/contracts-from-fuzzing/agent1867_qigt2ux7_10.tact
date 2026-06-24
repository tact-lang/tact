struct S {
    a: Int;
    b: Bool;
    c: Int?;
}

contract ArrayOfStructs {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{a:1,b:true,c:null};
        self.s2 = S{a:2,b:false,c:3};
        self.s3 = S{a:3,b:true,c:4};
    }
}