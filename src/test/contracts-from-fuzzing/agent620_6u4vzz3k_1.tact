struct DeepNested {
    innermost: Int;
}

struct NestedLevel2 {
    nested: DeepNested;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
}

contract DeepStructStorage {
    nestedField: NestedLevel1;

    init() {
        self.nestedField = NestedLevel1{
            nested2: NestedLevel2{
                nested: DeepNested{
                    innermost: 123
                }
            }
        };
    }
}