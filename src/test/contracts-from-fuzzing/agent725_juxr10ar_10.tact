struct StructA {
    valA: Int;
}

struct StructB {
    valB: Int;
    innerA: StructA;
}

struct StructC {
    valC: Int;
    innerB: StructB;
}

contract ManyLevels {
    fieldC: StructC;

    init() {
        self.fieldC = StructC{
            valC: 3,
            innerB: StructB{valB: 2, innerA: StructA{valA: 1}}
        };
    }
}