struct StructA {
    intVal: Int;
}

struct StructB {
    boolVal: Bool;
}

struct StructC {
    nestedA: StructA;
    nestedB: StructB;
}

struct StructD {
    fieldC: StructC;
    intVal: Int;
}

contract TestContract {
    fieldD: StructD;

    init() {
        self.fieldD = StructD{
            fieldC: StructC{
                nestedA: StructA{ intVal: 8 },
                nestedB: StructB{ boolVal: false }
            },
            intVal: 9
        };
    }
}