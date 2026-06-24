struct NestedWithDefaults {
    a: Int = 1;
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    x: Int = 42;
    b: Bool = true;
}

contract NestedDefaultsTest {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults {
            inner: InnerWithDefaults {}
        };
    }
}