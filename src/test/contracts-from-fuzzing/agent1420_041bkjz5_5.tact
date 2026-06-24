struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
}

contract TestContract {
    inner: Inner = Inner{ nested: InnerMost{ val: 123 } };
    init() {}
}