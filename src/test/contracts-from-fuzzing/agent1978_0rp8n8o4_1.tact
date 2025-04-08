struct DeepNest {
    inner: Inner?
}

struct Inner {
    value: Int?;
}

contract TestContract {
    item: DeepNest;

    init() {
        self.item = DeepNest{
            inner: Inner{
                value: 10
            }
        };
    }
}
