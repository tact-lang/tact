struct DeepNested {
    inner: Inner;
    toggle: Bool;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract NestedContract {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            inner: Inner{ value: 1, flag: true },
            toggle: false
        };
    }
}