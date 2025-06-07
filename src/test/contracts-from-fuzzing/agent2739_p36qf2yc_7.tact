struct InlineDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "default";
}

contract TestContract {
    data: InlineDefaults;
    init() {
        self.data = InlineDefaults{};
    }
}