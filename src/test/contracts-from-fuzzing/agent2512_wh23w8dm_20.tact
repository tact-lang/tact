struct Inner {
    num: Int;
}

contract NestedFieldOptionals {
    inner: Inner?;

    init() {
        self.inner = Inner{num:42};
    }
}