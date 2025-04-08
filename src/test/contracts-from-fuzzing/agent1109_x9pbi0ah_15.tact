struct BoolDefaultTest {
    val1: Bool = true;
    val2: Bool = false;
}

contract BoolDefaults {
    data: BoolDefaultTest;

    init() {
        self.data = BoolDefaultTest{};
    }
}