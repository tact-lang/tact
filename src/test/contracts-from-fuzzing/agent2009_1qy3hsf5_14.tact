struct StructA { fieldA: Int; }
struct StructB { fieldB: Int; }
struct StructC {
    nestedA: StructA;
    nestedB: StructB;
    fieldC: Int;
}

contract ManyNestedStructs {
    outer: StructC;
    init() {
        self.outer = StructC{
            nestedA: StructA{fieldA:1},
            nestedB: StructB{fieldB:2},
            fieldC: 3
        };
    }
}