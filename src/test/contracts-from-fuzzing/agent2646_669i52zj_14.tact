struct NestedOptDefault {
    foo: Int? = null;
}

contract NestedOptDefaults {
    s: NestedOptDefault;
    init() {
        self.s = NestedOptDefault{};
    }
    receive() {}
}