struct S {
    a: Int;
}

contract ArrayOfStructs {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{a:1};
        self.s2 = S{a:2};
        self.s3 = S{a:3};
    }
}