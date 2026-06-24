struct BoolDefaults {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool = true;
}

contract TestContract {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}