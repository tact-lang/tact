struct Sub {
    s: String;
    n: Int;
}

struct ContainerOpt {
    opt: Sub?;
    other: Int;
}

contract Test {
    field: ContainerOpt;
    init() {
        self.field = ContainerOpt{ opt: null, other: 999 };
    }
}
// optional struct nested inside a container struct persisted