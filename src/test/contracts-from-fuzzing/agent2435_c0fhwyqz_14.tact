struct InlineDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "test";
}

contract TestContract {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}