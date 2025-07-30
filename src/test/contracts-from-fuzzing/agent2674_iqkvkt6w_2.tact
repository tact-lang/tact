struct DeeplyNested {
    inner: InnerLayer;
}

struct InnerLayer {
    core: CoreLayer;
}

struct CoreLayer {
    value: Int;
    flag: Bool;
}

contract NestedStructDepthTest {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            inner: InnerLayer{
                core: CoreLayer{
                    value: 42,
                    flag: true,
                },
            },
        };
    }
}