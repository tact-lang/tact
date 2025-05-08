struct StructA {
    fieldA: Int;
}

struct StructB {
    nestedA: StructA;
    fieldB: Bool;
}

struct StructC {
    nestedB: StructB;
    fieldC: String;
}

contract StructNestComboTest {
    data: StructC;

    init() {
        self.data = StructC{
            nestedB: StructB{
                nestedA: StructA{ fieldA: 50 },
                fieldB: false
            },
            fieldC: "text"
        };
    }
}