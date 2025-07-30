struct NestedDefaults {
    inner: InnerDefault;
}

struct InnerDefault {
    x: Int = 7;
    y: Bool = false;
}

contract NestedDefaultsTest {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{
            inner: InnerDefault{}
        };
    }
}