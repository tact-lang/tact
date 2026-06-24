struct BoolDefaults {
    yes: Bool = true;
    no: Bool = false;
}

contract BoolDefStorage {
    val: BoolDefaults;

    init() {
        self.val = BoolDefaults{};
    }
}