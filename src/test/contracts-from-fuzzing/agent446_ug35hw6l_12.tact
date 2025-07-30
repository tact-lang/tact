struct NestedDefaults {
    x: Int = 1;
    y: Int = 2;
}

struct Container {
    nested: NestedDefaults = NestedDefaults{};
    z: Int = 3;
}

contract ContainerDefaults {
    data: Container;

    init() {
        self.data = Container{};
    }
}