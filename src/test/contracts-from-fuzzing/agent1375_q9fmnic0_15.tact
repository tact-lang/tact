struct OptStruct {
    inner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract OptionalSubStruct {
    val: OptStruct;

    init() {
        self.val = OptStruct{ inner: null };
    }
}