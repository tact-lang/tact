struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
}

contract Test {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ inner: Inner{ flag: false } };
    }
}