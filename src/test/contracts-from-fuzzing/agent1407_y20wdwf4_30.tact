struct Inner {
    optSlice: Slice?;
    addr: Address;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{ optSlice: null, addr: myAddress() };
    }
}