struct S0 {
    a0: Int;
    b0: Bool;
}

struct S1 {
    a1: Int;
    s0: S0;
}

struct S2 {
    a2: Int;
    s1: S1;
}

struct S3 {
    a3: Int;
    s2: S2;
}

struct S4 {
    a4: Int;
    s3: S3;
}

struct S5 {
    a5: Int;
    s4: S4;
}

contract TestContract {
    nested: S5;

    init() {
        self.nested = S5{
            a5: 5,
            s4: S4{
                a4: 4,
                s3: S3{
                    a3: 3,
                    s2: S2{
                        a2: 2,
                        s1: S1{
                            a1: 1,
                            s0: S0{a0: 0, b0: true},
                        },
                    },
                },
            },
        };
    }
}