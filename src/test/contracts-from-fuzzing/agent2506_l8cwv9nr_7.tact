struct StructA {
    intVal: Int;
}

struct StructB {
    boolVal: Bool;
    strVal: String;
    nestedA: StructA;
}

struct StructC {
    s1: StructA;
    s2: StructB;
    maybeInt: Int?;
    moreStr: String;
}

contract WideNestedTypesTest {
    storage: StructC;

    init() {
        self.storage = StructC{
            s1: StructA{ intVal: 55 },
            s2: StructB{
                boolVal: true,
                strVal: "abc",
                nestedA: StructA{ intVal: 66 },
            },
            maybeInt: null,
            moreStr: "xyz",
        };
    }
}
