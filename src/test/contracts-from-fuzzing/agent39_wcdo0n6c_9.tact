struct InnerOpt {
    y: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptTest {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            inner: InnerOpt{ y: 99 }
        };
    }
}