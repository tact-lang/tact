struct StructA {
    value1: Int;
}

struct StructB {
    value2: Int;
    nested: StructA;
}

struct StructC {
    nestedB: StructB;
    optField: Bool?;
    strField: String;
}

contract TestContract {
    data: StructC;

    init() {
        self.data = StructC{
            nestedB: StructB{
                value2: 10,
                nested: StructA{ value1: 5 }
            },
            optField: null,
            strField: "abc"
        };
    }
}