struct DeepOptionalInner {
    nested: InnerLayer?;
}

struct InnerLayer {
    inside: String?;
}

contract OptionalNestedContract {
    data: DeepOptionalInner;

    init() {
        self.data = DeepOptionalInner{
            nested: null
        };
    }
}