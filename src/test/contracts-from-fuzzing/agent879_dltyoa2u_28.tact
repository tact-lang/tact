struct OptionalNesting {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

struct ContainerOpt {
    nested: OptionalNesting?;
}

contract NestedOptionalContainer {
    data: ContainerOpt;
    init() {
        self.data = ContainerOpt{ nested: null };
    }
}
