struct NestedDefaults {
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    x: Int = 10;
    y: Int = 20;
}

contract NestedDefaultsTest {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner: InnerWithDefaults{}
        };
    }
}