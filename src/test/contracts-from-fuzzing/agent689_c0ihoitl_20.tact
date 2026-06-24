struct InnerOpt {
    number: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionChainTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{ number: null },
        };
    }
}