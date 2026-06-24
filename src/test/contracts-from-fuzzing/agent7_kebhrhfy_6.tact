struct DeepOpt {
    x: Int?;
    y: Int?;
}

struct ContainerOpt {
    inner: DeepOpt?;
}

contract OptInOpt {
    data: ContainerOpt?;

    init() {
        self.data = ContainerOpt{
            inner: null
        };
    }
}