struct ComplexStructure {
    intField: Int;
    strField: String;
    boolField: Bool;
    optInt: Int?;
    optStr: String?;
    nested: NestedStruct;
}

struct NestedStruct {
    innerBool: Bool;
    innerInt: Int;
}

contract TestContract {
    data: ComplexStructure;

    init() {
        self.data = ComplexStructure{
            intField: 1,
            strField: "abc",
            boolField: true,
            optInt: null,
            optStr: null,
            nested: NestedStruct{ innerBool: false, innerInt: 0 }
        };
    }
}