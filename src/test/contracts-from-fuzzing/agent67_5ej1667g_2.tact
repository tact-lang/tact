struct DeepNest {
    n1: Int;
    n2: NestedOpt;
}

struct NestedOpt {
    inner: Int?;
}

contract TestContract {
    storage: DeepNest;
    init() {
        self.storage = DeepNest{
            n1: 1,
            n2: NestedOpt{ inner: null },
        };
    }
}