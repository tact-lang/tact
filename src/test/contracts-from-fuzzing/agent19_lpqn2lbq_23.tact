struct IntWrap {
    inner: Int;
}

contract WrapTest {
    wrapped: IntWrap;

    init() {
        self.wrapped = IntWrap{inner: 42};
    }
}