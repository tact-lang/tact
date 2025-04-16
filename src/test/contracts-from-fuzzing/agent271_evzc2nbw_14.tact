struct NestedWithDefault {
    x: Int = 10;
}

contract NestedDefaultTest {
    s: NestedWithDefault;

    init() {
        self.s = NestedWithDefault{};
    }
}
