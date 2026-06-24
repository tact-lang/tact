struct BoolDefault {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefaultsTest {
    bf: BoolDefault;

    init() {
        self.bf = BoolDefault{};
    }
}