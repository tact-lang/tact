struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolDefaultTest {
    rec: BoolDefaults;

    init() {
        self.rec = BoolDefaults{};
    }
}