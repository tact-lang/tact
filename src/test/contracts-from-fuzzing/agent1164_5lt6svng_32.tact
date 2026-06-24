struct DeepOpt {
    inner: Int?;
}

struct DeepNestOpt {
    inner: DeepOpt?;
}

contract DoubleLayerOpt {
    field: DeepNestOpt;

    init() {
        self.field = DeepNestOpt{
            inner: null
        };
    }
}