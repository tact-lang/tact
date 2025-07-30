struct OptionalNestedStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalInState {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{ inner: null };
    }
}