struct InnerOpt {
    n: Int?;
}

struct ContainerOpt {
    inner: InnerOpt?;
}

contract ChainOpt {
    container: ContainerOpt;
    init() {
        self.container = ContainerOpt{
            inner: null,
        };
    }
}