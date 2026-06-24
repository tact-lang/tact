struct BoolOptDefaults {
    x: Bool? = false;
    y: Bool? = true;
}

contract BoolOptDefaultsContract {
    data: BoolOptDefaults;

    init() {
        self.data = BoolOptDefaults{};
    }
}