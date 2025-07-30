struct InnerOpt {
    a: Int?;
}

struct WithInnerOpt {
    inner: InnerOpt?;
    b: Int;
}

contract OptOptTest {
    st: WithInnerOpt;

    init() {
        self.st = WithInnerOpt{
            inner: null,
            b: 5
        };
    }
}