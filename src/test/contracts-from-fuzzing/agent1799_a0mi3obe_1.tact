struct DeepNested {
    value: Int;
}

struct NestedLevel2 {
    nested: DeepNested;
}

struct NestedLevel1 {
    nested: NestedLevel2;
}

contract TestNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            nested: NestedLevel2{
                nested: DeepNested{
                    value: 123
                }
            }
        };
    }
}
