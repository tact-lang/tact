struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedStruct {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{ inner: null };
    }
}
