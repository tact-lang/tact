struct OptionalWrap {
    x: Int;
}

contract OptionalWrapTest {
    a: OptionalWrap?;
    b: OptionalWrap?;

    init() {
        self.a = OptionalWrap{x: 1};
        self.b = null;
    }
}