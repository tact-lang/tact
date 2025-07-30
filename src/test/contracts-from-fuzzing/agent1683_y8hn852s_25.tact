struct InnerOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainerOptional {
    nested: InnerOptionals?;
}

contract OptionalsRecursion {
    data: ContainerOptional;

    init() {
        self.data = ContainerOptional{};
    }

    receive() {
        self.data = ContainerOptional{ nested: InnerOptionals{ a: 1, b: true, c: "yo" } };
    }
}