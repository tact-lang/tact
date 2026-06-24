struct NestedWithDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct ContainerWithDefaults {
    n1: NestedWithDefaults = NestedWithDefaults{};
    n2: NestedWithDefaults = NestedWithDefaults{};
}

contract DefaultsCascade {
    c: ContainerWithDefaults = ContainerWithDefaults{};
    init() {
        self.c = ContainerWithDefaults{};
    }
}
