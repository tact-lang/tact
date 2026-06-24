struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptNestedTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{ val: 42 }
        };
    }
}
