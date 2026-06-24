struct StructA {
    b: StructB;
}

struct StructB {
    c: StructC;
}

struct StructC {
    d: StructD;
}

struct StructD {
    value: Int;
}

contract DeepDeepTest {
    pers: StructA;

    init() {
        self.pers = StructA{
            b: StructB{
                c: StructC{
                    d: StructD{
                        value: 451
                    }
                }
            }
        };
    }
}