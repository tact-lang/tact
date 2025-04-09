struct NestedDefaults {
    a: Int = 1;
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    b: Int = 2;
    c: String = "Hi";
}

contract NestedDefaultsTest {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner: InnerWithDefaults{}
        };
    }
}
