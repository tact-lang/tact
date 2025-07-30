struct InnerDefaults {
    n: Int = 42;
}

contract InitNoOverride {
    data: InnerDefaults;

    init() {
        self.data = InnerDefaults{};
    }
}
