struct DeepOptionalInner {
    nested: InnerWrap?;
}

struct InnerWrap {
    extra: InnerDeep;
}

struct InnerDeep {
    value: Int;
}

contract OptDeepTest {
    field: DeepOptionalInner;

    init() {
        self.field = DeepOptionalInner{
            nested : null
        };
    }
}
