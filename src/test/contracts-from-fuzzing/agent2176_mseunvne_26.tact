struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    s: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 5;
    y: Bool = true;
}

contract NestedDefaultsTest {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            s: InnerDefaults{}
        };
    }
}
