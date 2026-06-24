struct StructA {
    intField: Int;
    boolField: Bool;
}

struct StructB {
    nestedA: StructA;
    anotherInt: Int;
}

struct StructC {
    nestedB: StructB;
    strField: String;
}

contract DeeplyNestedContract {
    s: StructC;

    init() {
        self.s = StructC{
            nestedB: StructB{
                nestedA: StructA{
                    intField: 42,
                    boolField: true
                },
                anotherInt: 100
            },
            strField: "deep"
        };
    }
}
