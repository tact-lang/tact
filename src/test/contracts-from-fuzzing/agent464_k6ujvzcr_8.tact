struct NestedDefaultsInner {
    a: Int = 1;
    b: Bool = false;
}

struct NestedDefaultsOuter {
    inner: NestedDefaultsInner = NestedDefaultsInner{};
    c: String = "hello";
}

contract NestedDefaultsTest {
    data: NestedDefaultsOuter;

    init() {
        self.data = NestedDefaultsOuter{};
    }
}