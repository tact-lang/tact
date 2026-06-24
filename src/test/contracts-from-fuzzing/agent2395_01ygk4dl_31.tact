struct BoolDefault {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool? = null;
}

contract BoolDefaultTest {
    s: BoolDefault;
    init() {
        self.s = BoolDefault{};
    }
}
