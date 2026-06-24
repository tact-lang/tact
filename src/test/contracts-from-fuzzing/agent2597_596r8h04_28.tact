contract NestedOptional {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}

struct Inner {
    val: Int;
}