struct S1 {
    i: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

struct S4 {
    s: S3;
}

struct S5 {
    s: S4;
}

contract DeepChain {
    x: S5;

    init() {
        self.x = S5{
            s: S4{
                s: S3{
                    s: S2{
                        s: S1{
                            i: 42,
                        },
                    },
                },
            },
        };
    }
}