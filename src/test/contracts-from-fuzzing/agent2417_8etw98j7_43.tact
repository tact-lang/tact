struct OptionalLayer {
    layer: OptionalInner?;
}

struct OptionalInner {
    val: Int?;
}

contract OptionalNestedWrap {
    p: OptionalLayer;

    init() {
        self.p = OptionalLayer{ layer: OptionalInner{ val: null } };
    }
}
