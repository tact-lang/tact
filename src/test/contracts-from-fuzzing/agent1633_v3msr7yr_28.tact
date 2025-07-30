struct InnerOpt {
    i: Int?;
}
struct OuterOpt {
    inner: InnerOpt;
}

contract OptionalChains {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{ i: null }
        };
    }
}