struct HasOpt {
    foo: Int?;
}

struct DeeperOpt {
    bar: HasOpt?;
}

struct DeepestOpt {
    baz: DeeperOpt?;
}

contract TestContract {
    nestedOpt: DeepestOpt;

    init() {
        self.nestedOpt = DeepestOpt{
            baz: null
        };
    }
}