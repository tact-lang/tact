struct Inner {
    foo: Slice as remaining;
}

struct Outer {
    inner: Inner;
    bar: Slice as remaining;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ inner: Inner{ foo: "".asComment().asSlice() }, bar: "".asComment().asSlice() };
    }
}