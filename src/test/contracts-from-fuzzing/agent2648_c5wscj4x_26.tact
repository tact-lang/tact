struct S0 { val: Int? }
struct S1 { s0: S0; opt: S0? }
struct S2 { s1: S1; opt: S1? }
struct S3 { s2: S2; opt: S2? }
struct S4 { s3: S3; opt: S3? }
struct S5 { s4: S4; opt: S4? }

contract DeepNestedOpt {
    deep: S5;

    init() {
        self.deep = S5{
            s4: S4{
                s3: S3{
                    s2: S2{
                        s1: S1{
                            s0: S0{ val: null },
                            opt: null
                        },
                        opt: null
                    },
                    opt: null
                },
                opt: null
            },
            opt: null
        };
    }
}