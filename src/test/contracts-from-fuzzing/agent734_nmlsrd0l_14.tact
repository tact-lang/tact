struct NestedOptionalDefaults {
    inner: Inner? = null;
}

struct Inner {
    foo: Int = 77;
}

contract NestedOptionalDefaultsTest {
    data: NestedOptionalDefaults;

    init() {
        self.data = NestedOptionalDefaults{};
    }
}
