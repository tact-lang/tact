struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool? = null;
    b4: Bool? = true;
}

contract TestContract {
    state: BoolDefaults;

    init() {
        self.state = BoolDefaults{};
    }
}