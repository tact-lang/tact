struct DeepInner {
    id: Int;
    active: Bool;
    label: String;
}

struct Medium {
    inner: DeepInner;
    note: String;
}

contract NestedWithMix {
    nested: Medium;

    init() {
        self.nested = Medium{
            inner: DeepInner{
                id: 42,
                active: true,
                label: "deep"
            },
            note: "mid"
        };
    }
}