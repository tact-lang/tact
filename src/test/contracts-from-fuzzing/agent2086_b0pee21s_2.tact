struct DeepInner {
    value: Int;
    status: Bool;
}

struct Middle {
    inner: DeepInner;
    label: String;
}

contract DeepNestedContract {
    field: Middle;

    init() {
        self.field = Middle{
            inner: DeepInner{ value: 123, status: false },
            label: "test"
        };
    }
}