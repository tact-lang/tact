struct InnerMost {
    val: Int;
}

struct Nested3 {
    inner: InnerMost;
}

struct Nested2 {
    nested: Nested3;
}

struct Nested1 {
    deep: Nested2;
}

contract DeepNestTest {
    storage: Nested1;

    init() {
        self.storage = Nested1{
            deep: Nested2{
                nested: Nested3{
                    inner: InnerMost{val: 99}
                }
            }
        };
    }
}