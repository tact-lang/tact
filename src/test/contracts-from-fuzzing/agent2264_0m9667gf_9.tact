struct DeepOptional {
    nested: DeepOptionalInner?;
}

struct DeepOptionalInner {
    data: Int?;
}

contract DeepOptTest {
    d: DeepOptional;
    init() {
        self.d = DeepOptional{
            nested: null
        };
    }
}
