struct NestedWithDefaults {
    a: Int = 5;
    s: String = "hello";
}

struct ContainerDefaults {
    inner: NestedWithDefaults = NestedWithDefaults{};
    flag: Bool = false;
}

contract NestedDefaults {
    data: ContainerDefaults;

    init() {
        self.data = ContainerDefaults{};
    }
}