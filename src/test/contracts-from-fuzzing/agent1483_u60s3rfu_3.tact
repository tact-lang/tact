struct DeepNested {
    inner: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract DeepNestedTest {
    data: DeepNested?;

    init() {
        self.data = null;
    }
}