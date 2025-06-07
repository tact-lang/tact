struct CrazyMix {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    nested: NestedStruct;
    optNested: NestedStruct?;
}

struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    crazy: CrazyMix;
    
    init() {
        self.crazy = CrazyMix{
            intField: 1,
            boolField: true,
            strField: "str",
            optInt: null,
            optBool: null,
            optStr: null,
            nested: NestedStruct{a: 2, b: false},
            optNested: null
        };
    }
}