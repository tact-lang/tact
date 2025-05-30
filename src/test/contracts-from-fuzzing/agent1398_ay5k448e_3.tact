struct DeepNested {
    inner: InnerOpt;
}

struct InnerOpt {
    val: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract DeepNestedTest {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            inner: InnerOpt{
                val: Inner{
                    x: 7,
                    y: true,
                },
            },
        };
    }
}