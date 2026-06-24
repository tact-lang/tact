struct NestedDefaults {
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
}

contract NestedDefaultsTest {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner: InnerWithDefaults{},
        };
    }
}