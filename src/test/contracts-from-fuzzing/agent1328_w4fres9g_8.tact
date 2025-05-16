struct Struct1 {
    s1: Int;
}

struct Struct2 {
    s2: Struct1;
}

struct Struct3 {
    s3: Struct2;
}

struct Struct4 {
    s4: Struct3;
}

struct Struct5 {
    s5: Struct4;
}

struct Struct6 {
    s6: Struct5;
}

contract DeepChain {
    deep: Struct6;

    init() {
        self.deep = Struct6{
            s6: Struct5{
                s5: Struct4{
                    s4: Struct3{
                        s3: Struct2{
                            s2: Struct1{
                                s1: 999
                            }
                        }
                    }
                }
            }
        };
    }
}
