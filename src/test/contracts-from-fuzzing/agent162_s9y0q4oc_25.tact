struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
    opt: Bool? = null;
}

contract TestContract {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}