struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract Test {
    f0: Int;
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f0 = 0;
        self.f1 = S1{a:1};
        self.f2 = S2{s: S1{a:2}};
        self.f3 = S3{s: S2{s: S1{a:3}}};
    }
}