struct InnerDefault {
    val: Int = 7;
}

contract NestedDefaultInner {
    inner: InnerDefault;

    init() {
        self.inner = InnerDefault{};
    }
}