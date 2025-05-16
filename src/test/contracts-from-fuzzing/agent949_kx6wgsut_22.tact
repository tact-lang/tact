struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolDefaultTest {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}
