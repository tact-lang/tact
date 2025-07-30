struct NestedOptInner {
    inner: Int?;
}

contract NestedOptionWrap {
    wrap: NestedOptInner?;

    init() {
        self.wrap = NestedOptInner{ inner: null };
    }
}