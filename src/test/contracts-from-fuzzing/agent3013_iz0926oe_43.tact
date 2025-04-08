struct NestedInner {
    foo: Int?;
    bar: String?;
}

struct OuterMost {
    inner: NestedInner?;
    label: String;
}

contract VeryNested {
    val: OuterMost;

    init() {
        self.val = OuterMost { inner: null, label: "x" };
    }
}
