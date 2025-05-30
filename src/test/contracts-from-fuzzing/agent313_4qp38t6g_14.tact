struct NestedStructWithDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct ContainerWithDefaults {
    inner: NestedStructWithDefaults = NestedStructWithDefaults{};
    s: String = "test";
}

contract NestedDefaultsTest {
    val: ContainerWithDefaults;

    init() {
        self.val = ContainerWithDefaults{};
    }
}