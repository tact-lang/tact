struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract Test {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner: null,
        };
    }
}