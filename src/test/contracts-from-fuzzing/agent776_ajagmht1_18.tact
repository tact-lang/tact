struct InlineNested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    n: Int;
}

contract InlineNestedTest {
    val: InlineNested;
    init() {
        self.val = InlineNested{
            inner: Inner{ n: 33 },
            flag: false
        };
    }
}