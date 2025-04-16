struct OptionalNest {
    inner: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: Bool;
}

contract OptNestedTest {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{
            inner: InnerOpt{ a: null, b: true }
        };
    }
}