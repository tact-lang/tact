struct BoolDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
}

contract BoolDefaultsTest {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }

    receive() {
        self.data = BoolDefaults{flag1: false, flag2: true};
    }
}