struct DeepNestedLevel3 {
    x: Int;
}

struct DeepNestedLevel2 {
    inner: DeepNestedLevel3;
}

struct DeepNestedLevel1 {
    inner: DeepNestedLevel2;
}

contract TestContract {
    nested: DeepNestedLevel1;

    init() {
        self.nested = DeepNestedLevel1{
            inner: DeepNestedLevel2{
                inner: DeepNestedLevel3{
                    x: 42
                }
            }
        };
    }
}