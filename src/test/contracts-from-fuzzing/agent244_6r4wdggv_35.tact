struct InlineDefaults {
    a: Int = 5;
    b: Bool = false;
}

contract ExplicitDefaultInit {
    field: InlineDefaults;

    init() {
        self.field = InlineDefaults{};
    }
}