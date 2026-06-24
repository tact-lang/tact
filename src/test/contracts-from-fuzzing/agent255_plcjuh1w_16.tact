struct DeepOptionalWrap {
    level2: OptWrap?;
}

struct OptWrap {
    inner: InnerMost?;
}

struct InnerMost {
    val: Int;
}

contract MultiOptTest {
    f: DeepOptionalWrap;

    init() {
        self.f = DeepOptionalWrap{ level2: null };
    }
}