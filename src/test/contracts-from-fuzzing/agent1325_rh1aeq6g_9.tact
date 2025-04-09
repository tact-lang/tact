struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NullInnerTest {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            inner: null
        };
    }
}