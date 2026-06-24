struct DeepNested {
    inner: NestedInner;
}

struct NestedInner {
    val: Int;
    flag: Bool;
}

contract DeepStructTest {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            inner: NestedInner{
                val: 123,
                flag: false,
            },
        };
    }
}