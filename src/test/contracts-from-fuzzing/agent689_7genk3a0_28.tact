struct NestedOptDefault {
    inner: Int? = null;
}

contract DefaultOptional {
    s: NestedOptDefault;
    init() {
        self.s = NestedOptDefault{};
    }
}