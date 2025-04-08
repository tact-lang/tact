struct InlineDefaults {
    i: Int = 42;
    b: Bool = true;
    s: String = "hello";
}

contract TestContract {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}