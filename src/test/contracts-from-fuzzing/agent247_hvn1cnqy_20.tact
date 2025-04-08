struct NestedOptionalStruct {
    inner: Inner?;
    label: String;
}

struct Inner {
    val: Int;
}

contract OptionalStructStore {
    state: NestedOptionalStruct;

    init() {
        self.state = NestedOptionalStruct{
            inner: null,
            label: "hi"
        };
    }
}