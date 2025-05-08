struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Container {
    nested: NestedDefaults = NestedDefaults{};
    c: String = "hi";
}

contract NestedDefaultTest {
    data: Container;
    init() {
        self.data = Container{};
    }
}