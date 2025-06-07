struct OptionalStructInner {
    inner: Inner?;
}

struct Inner {
    a: Int;
}

contract OptStructInnerTest {
    val: OptionalStructInner;

    init() {
        self.val = OptionalStructInner{
            inner: null
        };
    }
}
