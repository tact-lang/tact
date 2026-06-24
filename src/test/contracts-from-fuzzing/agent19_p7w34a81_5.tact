struct NestedOptional {
    foo: Int?;
    bar: String?;
}

struct ContainerOpt {
    nestedOpt: NestedOptional?;
    active: Bool;
}

contract OptionalNestedContract {
    info: ContainerOpt;

    init() {
        self.info = ContainerOpt{
            nestedOpt: null,
            active: true,
        };
    }
}