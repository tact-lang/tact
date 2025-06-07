struct BoolDefaults {
    x: Bool = true;
    y: Bool = false;
    z: Bool = true;
}

contract TestContract {
    bdef: BoolDefaults;

    init() {
        self.bdef = BoolDefaults{};
    }
}