struct DeepNestedLevel3 {
    value: Int;
}

struct DeepNestedLevel2 {
    level3: DeepNestedLevel3;
}

struct DeepNestedLevel1 {
    level2: DeepNestedLevel2;
}

contract DeepNestedTest {
    data: DeepNestedLevel1;

    init() {
        self.data = DeepNestedLevel1{
            level2: DeepNestedLevel2{
                level3: DeepNestedLevel3{
                    value: 123,
                },
            },
        };
    }
}