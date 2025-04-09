struct Inner {
    payload: Slice as remaining;
}

struct Wrapper {
    inner: Inner;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: Inner{ payload: "".asComment().asSlice() }
        };
    }

    receive() {
        self.w = Wrapper{
            inner: Inner{ payload: "hi".asComment().asSlice() }
        };
    }
}