struct NestedDefaulted {
    a: Int = 1;
    b: Int = 2;
}

struct Container {
    nested: NestedDefaulted = NestedDefaulted{};
}

contract StructDefaultsTest {
    c: Container;
    init() {
        self.c = Container{};
    }
}