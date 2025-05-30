struct Overlap {
    inner: Inner;
}

struct Inner {
    nested: Nested;
}

struct Nested {
    val: Int;
}

contract NestedSameNames {
    data: Overlap;

    init() {
        self.data = Overlap{ inner: Inner{ nested: Nested{ val: 42 } } };
    }
}