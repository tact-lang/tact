struct DeepInner {
    flag: Bool;
    payload: Slice as remaining;
}

struct Outer {
    foo: Int as uint16;
    inner: DeepInner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            foo: 100,
            inner: DeepInner{ flag: true, payload: emptyCell().asSlice() }
        };
    }
}