struct OuterOpt {
    s: String?;
    inner: InnerOpt;
}

struct InnerOpt {
    b: Bool?;
}

contract NestedOptionalsTest {
    val: OuterOpt;

    init() {
        self.val = OuterOpt {
            s: null,
            inner: InnerOpt { b: null }
        };
    }
}