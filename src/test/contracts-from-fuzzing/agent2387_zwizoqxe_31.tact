struct VeryDeep {
    s1: S1;
}

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
    val1: Int;
    optVal: Int?;
}

contract Depth5Contract {
    data: VeryDeep;
    init() {
        self.data = VeryDeep{
            s1: S1{
                s2: S2{
                    s3: S3{
                        s4: S4{
                            s5: S5{
                                val1: 111,
                                optVal: null,
                            }
                        }
                    }
                }
            }
        };
    }
}