struct NestedOptOpt {
    inner: InnerWrap?;
}

struct InnerWrap {
    val: Int?;
}

contract NestedOptOptTest {
    s: NestedOptOpt;

    init() {
        self.s = NestedOptOpt{
            inner: InnerWrap{ val: null }
        };
    }
}