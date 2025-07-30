struct IntsDefaults {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    i4: Int = 4;
}

contract IntDefaultsStorage {
    val: IntsDefaults;

    init() {
        self.val = IntsDefaults{};
    }
}
