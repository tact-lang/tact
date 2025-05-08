struct InlineDefaults {
    x: Int = 3;
    y: Bool = false;
    s: String = "inline";
}

contract DefaultStructs {
    state: InlineDefaults;
    init() {
        self.state = InlineDefaults{};
    }
}