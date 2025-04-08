struct DeepDefault {
    v: Int = 42;
}

struct Container {
    nested: DeepDefault = DeepDefault{};
}

contract DefaultedDeep {
    data: Container;

    init() {
        self.data = Container{};
    }
}