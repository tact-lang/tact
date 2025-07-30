struct DeepStruct1 {
    val1: Int;
    val2: Int;
}

struct DeepStruct2 {
    s1: DeepStruct1;
    s2: DeepStruct1;
}

struct DeepStruct3 {
    d2_1: DeepStruct2;
    d2_2: DeepStruct2;
}

struct DeepStruct4 {
    d3_1: DeepStruct3;
    d3_2: DeepStruct3;
}

contract DeeplyNested {
    root: DeepStruct4;

    init() {
        self.root = DeepStruct4{
            d3_1: DeepStruct3{
                d2_1: DeepStruct2{
                    s1: DeepStruct1{val1: 1, val2: 2},
                    s2: DeepStruct1{val1: 3, val2: 4}
                },
                d2_2: DeepStruct2{
                    s1: DeepStruct1{val1: 5, val2: 6},
                    s2: DeepStruct1{val1: 7, val2: 8}
                }
            },
            d3_2: DeepStruct3{
                d2_1: DeepStruct2{
                    s1: DeepStruct1{val1: 9, val2: 10},
                    s2: DeepStruct1{val1: 11, val2: 12}
                },
                d2_2: DeepStruct2{
                    s1: DeepStruct1{val1: 13, val2: 14},
                    s2: DeepStruct1{val1: 15, val2: 16}
                }
            }
        };
    }
}
