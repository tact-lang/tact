struct NestedWithNullDefault {
    val: Int? = null;
}

contract NullDefaultsTest {
    n: NestedWithNullDefault;

    init() {
        self.n = NestedWithNullDefault{};
    }
}