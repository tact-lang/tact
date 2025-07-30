contract NestedOptionalsNull {
    s: Outer?;

    init() {
        self.s = null;
    }
}

struct Outer {
    inner: Inner?;
}

struct Inner {
    val: Int;
}