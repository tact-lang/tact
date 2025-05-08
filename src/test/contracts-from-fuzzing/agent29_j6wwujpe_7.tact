struct StructA {
    x: Int;
}

struct StructB {
    y: Int;
    nested: StructA;
}

struct StructC {
    z: Int;
    nestedB: StructB;
}

contract MultipleNestings {
    data: StructC;

    init() {
        self.data = StructC{
            z: 1,
            nestedB: StructB{
                y: 2,
                nested: StructA{
                    x: 3
                }
            }
        };
    }
}