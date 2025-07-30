struct MiddleOpt {
    inner: Int?;
}

struct OuterOpt {
    m: MiddleOpt?;
}

contract NestedOptionalsStorage {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{ m: null };
    }
}