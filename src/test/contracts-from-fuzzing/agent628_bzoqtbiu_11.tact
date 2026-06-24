struct InnerOpt {
    num: Int?;
    txt: String?;
}

struct OuterOpt {
    inner: InnerOpt;
    val: Int?;
}

contract NestedOptionalsOmitted {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            inner: InnerOpt{ num: 1 },
        };
    }
}