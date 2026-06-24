struct DeepOpt {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract NestedOpt {
    s: DeepOpt;

    init() {
        self.s = DeepOpt{
            inner: Inner{
                value: null
            }
        };
    }
}
