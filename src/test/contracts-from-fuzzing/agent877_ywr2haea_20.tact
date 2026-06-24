struct DeepOptionalInner {
    val: Int;
}

struct DeepOptionalOuter {
    nested: DeepOptionalInner?;
}

contract DeepOptionalTest {
    data: DeepOptionalOuter?;

    init() {
        self.data = DeepOptionalOuter{
            nested: null,
        };
    }
}