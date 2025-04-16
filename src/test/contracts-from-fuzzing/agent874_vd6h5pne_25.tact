struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    s: String;
}

contract OptChain {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{ a: 42, b: null },
            s: "test"
        };
    }
}
