struct DeepOpt {
    inner: Int?;
}

struct DeeperOpt {
    nested: DeepOpt?;
}

struct DeepestOpt {
    more: DeeperOpt?;
}

contract TestContract {
    dopt: DeepestOpt;

    init() {
        self.dopt = DeepestOpt{
            more: null,
        };
    }
}