struct BoolDefaults {
    x: Bool;
    y: Bool = true;
    z: Bool = false;
}

contract TestContract {
    bools: BoolDefaults;

    init() {
        self.bools = BoolDefaults{ x: true };
    }
}
