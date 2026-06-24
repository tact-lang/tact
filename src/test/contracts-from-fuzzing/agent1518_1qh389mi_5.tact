struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    txt: String?;
}

contract OptTest {
    val: OptionalNest;
    init() {
        self.val = OptionalNest{
            inner: Inner { flag: true, txt: null }
        };
    }
}