struct NestedDefaults {
    s: Int = 1;
    t: InnerDefault;
}

struct InnerDefault {
    x: Int = 2;
    y: Bool = true;
}

contract NestedDefaultsTest {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            t: InnerDefault{},
        };
    }
}