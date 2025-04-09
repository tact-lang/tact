struct DefaultedInner {
    val: Int? = null;
    flag: Bool? = null;
}

struct DefaultedOuter {
    inner: DefaultedInner? = null;
}

contract NestedOptionalsDefaulted {
    f: DefaultedOuter;

    init() {
        self.f = DefaultedOuter{};
    }
}