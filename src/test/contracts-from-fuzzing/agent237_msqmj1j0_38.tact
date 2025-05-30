struct EmptyWithDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract OnlyDefaults {
    d: EmptyWithDefaults;
    init() {
        self.d = EmptyWithDefaults{};
    }
}