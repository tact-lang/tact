struct S {
    a: Int;
    b: Int;
}

contract ArrayOfStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        self.s1 = S{a:1,b:2};
        self.s2 = S{a:3,b:4};
        self.s3 = S{a:5,b:6};
        self.s4 = S{a:7,b:8};
    }
}