struct StructA {
    x: Int;
}

struct StructB {
    a: StructA;
}

struct StructC {
    b: StructB;
    y: Int?;
}

contract NestingStructs {
    nested: StructC;
    init() {
        self.nested = StructC{
            b: StructB{
                a: StructA{x: 123}
            },
            y: null
        };
    }
}