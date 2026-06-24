struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Container {
    nested: NestedDefaults;
}

contract ContainerWithDefaults {
    c: Container;

    init() {
        self.c = Container{ nested: NestedDefaults{} };
    }
}
