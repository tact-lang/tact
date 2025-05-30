struct DeeplyNested {
    inner: InnerLayer;
}

struct InnerLayer {
    innerMost: Int;
}

contract DeepNestTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: InnerLayer{ innerMost: 42 },
        };
    }
}