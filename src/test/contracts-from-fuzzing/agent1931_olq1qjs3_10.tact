struct StructA {
    sB: StructB;
}

struct StructB {
    sC: StructC;
}

struct StructC {
    opt: StructD?;
}

struct StructD {
    val: Int;
}

contract MixedNest {
    data: StructA;

    init() {
        self.data = StructA{
            sB: StructB{
                sC: StructC{
                    opt: StructD{ val: 42 }
                }
            }
        };
    }
}