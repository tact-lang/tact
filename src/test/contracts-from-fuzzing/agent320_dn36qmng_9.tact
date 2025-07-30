struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2a: S2;
    s2b: S2;
}

contract Test {
    big: S3;

    init() {
        self.big = S3{
            s2a: S2{
                s1a: S1{a:1,b:2},
                s1b: S1{a:3,b:4},
            },
            s2b: S2{
                s1a: S1{a:5,b:6},
                s1b: S1{a:7,b:8},
            },
        };
    }
}