struct DeepNested {
    inner: Inner;
}

struct Inner {
    level: InnerMost;
}

struct InnerMost {
    value: Int?;
    flag: Bool;
}

contract TestContract {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            inner: Inner{
                level: InnerMost{
                    value: 42,
                    flag: true
                }
            }
        };
    }
}