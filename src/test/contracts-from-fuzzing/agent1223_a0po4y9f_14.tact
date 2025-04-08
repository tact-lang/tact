struct NestedOptDefault {
    a: Int? = null;
    b: Bool = false;
}

contract NestedDefaultValues {
    inner: NestedOptDefault;
    init() {
        self.inner = NestedOptDefault{};
    }
}