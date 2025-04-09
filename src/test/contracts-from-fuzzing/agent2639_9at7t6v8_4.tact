struct DeepNestedLevel2 {
    d: Int;
}

struct DeepNestedLevel1 {
    inner: DeepNestedLevel2;
}

struct DeepNested {
    nested: DeepNestedLevel1;
}

contract DeepNestedStructTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            nested: DeepNestedLevel1{
               inner: DeepNestedLevel2{
                   d: 777
               }
            }
        };
    }
}