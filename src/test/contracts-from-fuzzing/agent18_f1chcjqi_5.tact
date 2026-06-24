struct S {
    a: Int;
    b: String;
}

contract ArrayOfStructs {
    s1: S;
    s2: S;
    s3: S;
    init() {
        self.s1 = S{a:1,b:"x"};
        self.s2 = S{a:2,b:"y"};
        self.s3 = S{a:3,b:"z"};
    }
}