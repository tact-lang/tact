struct NestedLevel2 {
    deepField: Int;
}

struct NestedLevel1 {
    nested: NestedLevel2;
    optionalNested: NestedLevel2?;
}

contract DeepNestContract {
    nestedStruct: NestedLevel1;
    optionalNestedStruct: NestedLevel1?;

    init() {
        self.nestedStruct = NestedLevel1{
            nested: NestedLevel2{ deepField: 1 },
            optionalNested: null
        };
        self.optionalNestedStruct = null;
    }
}