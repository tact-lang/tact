struct OptionalInnerInner {
    f1: Int?;
}

struct OptionalInnerWrap {
    f2: OptionalInnerInner?;
}

contract OptionalLayers {
    val: OptionalInnerWrap;

    init() {
        self.val = OptionalInnerWrap{
            f2: null,
        };
    }
}