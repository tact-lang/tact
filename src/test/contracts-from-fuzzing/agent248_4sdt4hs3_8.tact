struct NestedOpt {
    field1: Int?;
    field2: Bool?;
    inner: DeepInner?;
}

struct DeepInner {
    d1: Int?;
    d2: Bool?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            field1: null,
            field2: true,
            inner: DeepInner{ d1: 5, d2: null },
        };
    }
}