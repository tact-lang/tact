struct DeepOptionalInner {
    xx: Int;
    yy: Bool?;
}

struct DeepOptionalOuter {
    ref1: DeepOptionalInner?;
    message: String;
}

contract DeepNestedOptionalTest {
    data: DeepOptionalOuter;

    init() {
        self.data = DeepOptionalOuter{
            ref1: DeepOptionalInner{ xx: 123, yy: true },
            message: "hi"
        };
    }
}