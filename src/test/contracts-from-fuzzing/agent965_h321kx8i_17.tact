struct OptionalWrap {
    inner: Inner?;
}

struct Inner {
    value: Int;
}

contract OptWrapTest {
    val: OptionalWrap;

    init() {
        self.val = OptionalWrap{
            inner: null
        };
    }
}