struct S1 { val: Int; }
struct S2 { val: Int; }
struct S3 { val: Int; }
struct S4 { val: Int; }
struct S5 { val: Int; }

struct NestAll {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
}

contract ManyNestings {
    storage: NestAll;

    init() {
        self.storage = NestAll{
            s1: S1{val:1},
            s2: S2{val:2},
            s3: S3{val:3},
            s4: S4{val:4},
            s5: S5{val:5}
        };
    }
}