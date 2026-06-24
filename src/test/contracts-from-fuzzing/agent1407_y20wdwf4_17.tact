struct Inner {
    s: Slice as remaining;
}

struct Outer {
    inner: Inner;
    value: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ s: emptyCell().asSlice() },
            value: 123
        };
    }
}