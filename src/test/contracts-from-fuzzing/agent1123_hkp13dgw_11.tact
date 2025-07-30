struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract WideDeep {
    nested1: S1;
    nested2: S2;
    nested3: S3;

    init() {
        self.nested1 = S1{x:1};
        self.nested2 = S2{s1:S1{x:2}};
        self.nested3 = S3{s2:S2{s1:S1{x:3}}};
    }
}