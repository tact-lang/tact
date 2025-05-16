struct NestedOpt {
    x: Int?;
    y: String?;
}

struct ContainerOpt {
    a: NestedOpt?;
    b: Int?;
}

contract MultiLayerOpt {
    val: ContainerOpt;
    init() {
        self.val = ContainerOpt{
            a: null,
            b: null
        };
    }
}