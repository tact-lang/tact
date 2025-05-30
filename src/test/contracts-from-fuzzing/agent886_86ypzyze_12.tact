struct NestedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract TestContract {
    inner: NestedDefaults;
    init() {
        self.inner = NestedDefaults{};
    }
}