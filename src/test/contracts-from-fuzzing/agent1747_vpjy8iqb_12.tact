struct InnerOpt {
    maybeVal: Int?;
}

struct OuterOpt {
    nestedOpt: InnerOpt?;
}

contract NestedOptionTypeTest {
    payload: OuterOpt;

    init() {
        self.payload = OuterOpt{ nestedOpt: null };
    }
}