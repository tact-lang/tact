struct NestedStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
    inner3: InnerStruct;
}

struct InnerStruct {
    num: Int;
    flag: Bool;
    optionalInt: Int?;
}

contract ManyNestedFields {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            inner1: InnerStruct{ num: 1, flag: true, optionalInt: null },
            inner2: InnerStruct{ num: 2, flag: false, optionalInt: 3 },
            inner3: InnerStruct{ num: 4, flag: true, optionalInt: null }
        };
    }
}