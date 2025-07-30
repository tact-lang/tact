struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2a: S2;
    s2b: S2;
}

contract VeryDeep {
    val: S3;

    init() {
        self.val = S3{
            s2a: S2{
                s1a: S1{f1: 1, f2: true},
                s1b: S1{f1: 2, f2: false}
            },
            s2b: S2{
                s1a: S1{f1: 3, f2: false},
                s1b: S1{f1: 4, f2: true}
            }
        };
    }
}
