struct S0 {
    v: Int;
}

struct S1 {
    s: S0;
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

struct S6 {
    s: S5;
}

struct S7 {
    s: S6;
}

struct S8 {
    s: S7;
}

contract ExtremeDeep {
    field: S8;

    init() {
        self.field = S8{
            s: S7{
                s: S6{
                    s: S5{
                        s: S4{
                            s: S3{
                                s: S2{
                                    s: S1{
                                        s: S0{
                                            v: 999,
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        };
    }
}