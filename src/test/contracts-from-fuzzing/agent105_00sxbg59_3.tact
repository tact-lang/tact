struct DeepNested {
    i1: Int;
    inner: InnerMost;
}

struct InnerMost {
    flag: Bool?;
}

contract DeepNestedContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            i1: 7,
            inner: InnerMost{
                flag: null,
            },
        };
    }
}