struct ABool {
    val: Bool;
}

contract NestedBoolOpt {
    inner: ABool?;

    init() {
        self.inner = null;
    }
}