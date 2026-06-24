struct StructA {
    x: Int;
}

struct StructB {
    y: StructA;
}

struct StructC {
    z: StructB;
}

struct StructD {
    w: StructC;
}

contract DeepNest {
    d: StructD;

    init() {
        self.d = StructD{
            w: StructC{
                z: StructB{
                    y: StructA{
                        x: 1
                    }
                }
            }
        };
    }
}