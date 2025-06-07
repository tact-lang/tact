struct InlineDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "ok";
}

contract TestContract {
    v: InlineDefaults;

    init() {
        self.v = InlineDefaults{};
    }
}