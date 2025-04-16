struct StructA {
    x: Int;
}

struct StructB {
    y: StructA;
}

struct StructC {
    z: StructB;
}

contract NestThreeStructs {
    f: StructC;

    init() {
        self.f = StructC{
            z: StructB{
                y: StructA{
                    x: 999
                }
            }
        };
    }
}