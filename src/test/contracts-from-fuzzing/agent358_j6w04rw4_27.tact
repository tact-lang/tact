struct NestedOptionals {
    a: Int?;
    b: Bool?;
}

struct ContainerOpt {
    nested: NestedOptionals?;
    s: String;
}

contract OptInOpt {
    data: ContainerOpt;
    init() {
        self.data = ContainerOpt{
            nested: null,
            s: "abc"
        };
    }
}