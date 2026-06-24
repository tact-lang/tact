struct S1 { f1: Int; }
struct S2 { f2: Int; }
struct S3 { f3: Int; }

struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract TestContract {
    c1: Combo;
    c2: Combo;

    init() {
        self.c1 = Combo{s1: S1{f1:1}, s2:S2{f2:2}, s3:S3{f3:3}};
        self.c2 = Combo{s1: S1{f1:4}, s2:S2{f2:5}, s3:S3{f3:6}};
    }
}