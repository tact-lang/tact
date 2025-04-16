struct NestedOptStruct {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalStructStorage {
    value: NestedOptStruct?;

    init() {
        self.value = null;
    }
}