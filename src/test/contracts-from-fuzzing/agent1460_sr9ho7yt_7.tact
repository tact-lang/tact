struct SDeep {
    inn: Int;
    opt_inn: Int?;
}

struct S1 {
    sdeep: SDeep;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract VeryDeepNested {
    store: S3;

    init() {
        self.store = S3{
            s2: S2{
                s1: S1{
                    sdeep: SDeep{
                        inn: 7,
                        opt_inn: null,
                    },
                },
            },
        };
    }
}
