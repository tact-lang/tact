struct NestedDefaults {
    s: String = "default";
    b: Bool = true;
}

contract StructDefaultsPropagation {
    inner: NestedDefaults;

    init() {
        self.inner = NestedDefaults{};
    }
}