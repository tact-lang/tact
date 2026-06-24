struct NestedLevel3 {
    value: Int;
}

struct NestedLevel2 {
    nested: NestedLevel3;
}

struct NestedLevel1 {
    nested: NestedLevel2;
}

contract DeepNestedTest {
    data: NestedLevel1;
    
    init() {
        self.data = NestedLevel1{
            nested: NestedLevel2{
                nested: NestedLevel3{
                    value: 42,
                },
            },
        };
    }
}