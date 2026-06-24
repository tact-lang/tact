struct NestedOptionals {
    optInner: Int?;
    optStr: String?;
}

struct ContainerOptional {
    nested: NestedOptionals?;
}

contract DeepOptionPersistent {
    container: ContainerOptional;

    init() {
        self.container = ContainerOptional{
            nested: NestedOptionals{ optInner: 55, optStr: null }
        };
    }
}
