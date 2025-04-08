struct Outer {
    first: Int;
    inner: Inner;
    last: Bool;
}

struct Inner {
    flag: Bool;
    val: Int;
}

contract TestNestedStruct {
    store: Outer;

    init() {
        self.store = Outer{
            first: 1,
            inner: Inner{flag: true, val: 5},
            last: false,
        };
    }
}
