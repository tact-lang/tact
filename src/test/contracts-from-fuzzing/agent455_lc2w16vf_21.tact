struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    s4: S4;
}

struct S4 {
    s5: S5;
}

struct S5 {
    value: Int;
}

contract DeepNest5 {
    data: S1;
    init() {
        self.data = S1{
            s2: S2{
                s3: S3{
                    s4: S4{
                        s5: S5{
                            value: 42,
                        },
                    },
                },
            },
        };
    }
}