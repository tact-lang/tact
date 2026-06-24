struct DeepOpt {
    nestedOpt: Int?;
}

struct Container {
    inner: DeepOpt?;
}

contract NullableDeep {
    store: Container;

    init() {
        self.store = Container{
            inner: null
        };
    }
}