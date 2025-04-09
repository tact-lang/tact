struct NestedWithOptionalDefaults {
    s: Inner? = null;
}

struct Inner {
    val: Int = 42;
}

contract NestedDefaultsTest {
    data: NestedWithOptionalDefaults;

    init() {
        self.data = NestedWithOptionalDefaults{};
    }
}