struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefContract {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}