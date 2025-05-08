struct Inner {
    num: Int;
    code: Slice as remaining;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            num: 123,
            code: emptyCell().asSlice()
        };
    }
}