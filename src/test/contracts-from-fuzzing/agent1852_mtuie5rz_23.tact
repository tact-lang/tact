struct S {
    a: Int;
    b: Int;
    c: Int;
}

contract StructArrayLike {
    s0: S;
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        self.s0 = S{a:0,b:1,c:2};
        self.s1 = S{a:3,b:4,c:5};
        self.s2 = S{a:6,b:7,c:8};
        self.s3 = S{a:9,b:10,c:11};
        self.s4 = S{a:12,b:13,c:14};
    }
}