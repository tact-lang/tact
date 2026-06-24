struct OptionalInner {
    innerStr: String?;
}

struct MiddleOpt {
    midStr: String;
    inner: OptionalInner?;
}

contract OptionalNestedStructs {
    nested: MiddleOpt;

    init() {
        self.nested = MiddleOpt{
            midStr: "hi",
            inner: null
        };
    }
}
