struct BigNested {
    a: NestedA;
    b: NestedB;
}

struct NestedA {
    s1: String;
    s2: String;
    s3: String;
}

struct NestedB {
    s4: String;
    s5: String;
    s6: String;
    sub: SubNested;
}

struct SubNested {
    s7: String;
    s8: String;
}

contract ContractBigNested {
    f: BigNested;

    init() {
        self.f = BigNested{
            a: NestedA{
                s1:"A1", s2:"A2", s3:"A3"
            },
            b: NestedB{
                s4:"B4", s5:"B5", s6:"B6",
                sub: SubNested{
                    s7:"S7", s8:"S8"
                }
            }
        };
    }
}
