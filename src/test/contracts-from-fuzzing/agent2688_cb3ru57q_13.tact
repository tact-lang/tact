struct S {
    a: Int;
    b: Int;
}

contract ArraySim {
    s0: S;
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s0 = S{a:1,b:2};
        self.s1 = S{a:3,b:4};
        self.s2 = S{a:5,b:6};
        self.s3 = S{a:7,b:8};
    }
}