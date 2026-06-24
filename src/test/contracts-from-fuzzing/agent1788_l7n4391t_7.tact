struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1_a: S1;
    s1_b: S1;
}

struct S3 {
    s2_a: S2;
    s2_b: S2;
}

contract TestContract {
    s3: S3;

    init() {
        self.s3 = S3{
            s2_a: S2{
                s1_a: S1{a: 1, b: true},
                s1_b: S1{a: 2, b: false}
            },
            s2_b: S2{
                s1_a: S1{a: 3, b: false},
                s1_b: S1{a: 4, b: true}
            }
        };
    }
}