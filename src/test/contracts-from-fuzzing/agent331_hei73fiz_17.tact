struct S1 { i: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }

contract FlatNest {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{i:1};
        self.f2 = S2{s1: S1{i:2}};
        self.f3 = S3{s2: S2{s1: S1{i:3}}};
    }
}