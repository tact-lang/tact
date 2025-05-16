struct NestedDefaulted {
    x: Int = 1;
    y: Bool = false;
}

struct Container {
    a: Int = 42;
    b: NestedDefaulted;
}

contract DefaultsInsideStructTest {
    store: Container;

    init() {
        self.store = Container{
            b: NestedDefaulted{}
        };
    }
}
