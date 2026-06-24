struct InnerDefault {
    a: Int = 22;
}

struct ComposedDefaults {
    inner: InnerDefault = InnerDefault{};
    val: Int = 42;
}

contract ComposedDefaultsTest {
    val: ComposedDefaults;

    init() {
        self.val = ComposedDefaults{};
    }
}