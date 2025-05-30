struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptInOpt {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            inner: null
        };
    }
}