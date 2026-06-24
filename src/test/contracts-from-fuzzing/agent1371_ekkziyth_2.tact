struct NestedStruct {
    innermost: Int?;
    innerOptional: Int?;
}

struct MiddleStruct {
    nested: NestedStruct;
    nestedOptional: NestedStruct?;
}

contract ComplexNested {
    mid: MiddleStruct;

    init() {
        self.mid = MiddleStruct{
            nested: NestedStruct{innermost: 1, innerOptional: null},
            nestedOptional: null
        };
    }
}