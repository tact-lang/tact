struct OptionalWrap {
    inner: String?;
}

contract OptionalWrapTest {
    f: OptionalWrap;

    init() {
        self.f = OptionalWrap{
            inner: null
        };
    }
}