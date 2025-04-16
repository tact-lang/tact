struct S {
    x: Int;
}

contract MultiVars {
    s1: S;
    s2: S;
    s3: S;
    init() {
        self.s1 = S{x:1};
        self.s2 = S{x:2};
        self.s3 = S{x:3};
    }
}