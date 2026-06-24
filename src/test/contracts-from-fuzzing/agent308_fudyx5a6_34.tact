struct BoolDefaultTest {
    a: Bool = true;
    b: Bool? = null;
}

contract BoolDefault {
    val: BoolDefaultTest;

    init() {
        self.val = BoolDefaultTest{};
    }
}
