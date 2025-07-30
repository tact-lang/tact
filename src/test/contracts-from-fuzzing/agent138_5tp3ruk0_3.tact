struct DeepNestedLevel3 {
    c: Int;
}

struct DeepNestedLevel2 {
    b: DeepNestedLevel3;
}

struct DeepNestedLevel1 {
    a: DeepNestedLevel2;
}

contract DeeplyNestedTest {
    data: DeepNestedLevel1;

    init() {
        self.data = DeepNestedLevel1{
            a: DeepNestedLevel2{
                b: DeepNestedLevel3{
                    c: 123
                }
            }
        };
    }
}