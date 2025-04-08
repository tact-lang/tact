struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract TestContract {
    val: BoolDefaults;

    init() {
        self.val = BoolDefaults{};
    }
}