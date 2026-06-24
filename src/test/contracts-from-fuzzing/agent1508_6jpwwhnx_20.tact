struct InlineDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "s";
}

contract TestContract {
    f1: InlineDefaults;

    init() {
        self.f1 = InlineDefaults{};
    }
}