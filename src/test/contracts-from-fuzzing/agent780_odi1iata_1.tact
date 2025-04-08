struct DeepNested {
    deep: DeepNestedInner;
}

struct DeepNestedInner {
    inner: DeepNestedInner2;
}

struct DeepNestedInner2 {
    leaf1: Int;
    leaf2: Bool?;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            deep: DeepNestedInner{
                inner: DeepNestedInner2{
                    leaf1: 1,
                    leaf2: true,
                }
            }
        };
    }
}
