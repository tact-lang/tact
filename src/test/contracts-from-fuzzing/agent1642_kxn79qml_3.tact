struct DeepNestedA {
    val: Int;
}

struct DeepNestedB {
    inner: DeepNestedA;
}

struct DeepNestedC {
    inner: DeepNestedB;
}

contract DeepNestedTest {
    data: DeepNestedC;

    init() {
        self.data = DeepNestedC{
            inner: DeepNestedB{
                inner: DeepNestedA{val: 42}
            }
        };
    }
}