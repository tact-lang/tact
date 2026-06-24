struct NestedWithDefault {
    a: Int = 5;
    b: Int? = null;
    c: Bool = true;
}

contract NestedDefaultsTest {
    val: NestedWithDefault;

    init() {
        self.val = NestedWithDefault{};
    }
}