struct DeepInner {
    value: Int?;
}

struct Inner {
    deep: DeepInner;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            deep: DeepInner{
                value: null,
            },
        };
    }
}