struct StructA {
    x: Int;
}

struct StructB {
    y: StructA;
}

struct StructC {
    z: StructB;
}

contract ChainNested {
    s: StructC;

    init() {
        self.s = StructC{
            z: StructB{
                y: StructA{
                    x: 42
                }
            }
        };
    }
}