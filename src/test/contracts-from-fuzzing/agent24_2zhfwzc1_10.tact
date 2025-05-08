struct NestedDefaultsInner {
    x: Int = 1;
    y: Int = 2;
}

struct NestedDefaultsOuter {
    inner: NestedDefaultsInner = NestedDefaultsInner{};
    label: String = "outer";
}

contract NestedDefaultValuesTest {
    val: NestedDefaultsOuter;

    init() {
        self.val = NestedDefaultsOuter{};
    }
}