struct DeepOpt {
    inner: String?;
}

struct OuterOpt {
    optInner: DeepOpt?;
}

contract OptContract {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            optInner: null
        };
    }
}