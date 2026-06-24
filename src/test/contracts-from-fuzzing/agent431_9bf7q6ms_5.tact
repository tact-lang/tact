struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

struct StructC {
    c: StructB;
}

struct StructD {
    d: StructC;
}

contract WideAndDeep {
    s: StructD;

    init() {
        self.s = StructD{
            d: StructC{
                c: StructB{
                    b: StructA{
                        a: 9999
                    }
                }
            }
        };
    }
}
