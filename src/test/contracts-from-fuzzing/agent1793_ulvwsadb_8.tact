struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    a: Int;
}

contract Test {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ inner: null };
    }
}