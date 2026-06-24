struct NestedDefaultsInner {
    x: Int = 123;
    y: Bool = false;
}

struct NestedDefaultsOuter {
    inner: NestedDefaultsInner = NestedDefaultsInner{};
    z: String = "hi";
}

contract TestContract {
    data: NestedDefaultsOuter;

    init() {
        self.data = NestedDefaultsOuter{};
    }
}