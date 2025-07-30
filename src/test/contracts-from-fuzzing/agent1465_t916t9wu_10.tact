struct NestedDefaults {
    a: Int = 7;
    b: Bool = false;
}

struct Outer {
    inner: NestedDefaults = NestedDefaults{};
    c: String = "default";
    d: Int;
}

contract NestedDefaultTest {
    val: Outer;

    init() {
        self.val = Outer{
            d: 42
        };
    }
}