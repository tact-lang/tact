struct Inner {
    m: map<Int, Int>;
    opt: Int?;
}

contract NestedOptionMap {
    f: Inner;

    init() {
        self.f = Inner{ m: emptyMap(), opt: null };
    }
}
