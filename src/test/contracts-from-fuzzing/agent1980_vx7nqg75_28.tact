struct MiddleOpt {
    v1: Int?;
    v2: Bool?;
}

struct ContainerOpt {
    middle: MiddleOpt?;
}

contract NullableNest {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{ middle: null };
    }
}