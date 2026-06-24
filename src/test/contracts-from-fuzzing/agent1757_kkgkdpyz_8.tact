struct VeryDeep {
    d1: Deep1;
}

struct Deep1 {
    d2: Deep2;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep3 {
    d4: Deep4;
}

struct Deep4 {
    d5: Deep5;
}

struct Deep5 {
    d6: Deep6;
}

struct Deep6 {
    val: Int;
}

contract ExtremelyDeepNested {
    data: VeryDeep;

    init() {
        self.data = VeryDeep{
            d1: Deep1{
                d2: Deep2{
                    d3: Deep3{
                        d4: Deep4{
                            d5: Deep5{
                                d6: Deep6{ val: 42 }
                            }
                        }
                    }
                }
            }
        };
    }
}