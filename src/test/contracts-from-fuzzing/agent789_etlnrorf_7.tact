struct InnerOpt {
    optBool: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalDeepNestedTest {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner: InnerOpt{
                optBool: null
            }
        };
    }
}