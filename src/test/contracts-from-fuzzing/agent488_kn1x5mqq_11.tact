struct Holder {
    data: Slice as remaining;
}

contract TestContract {
    s: Holder;

    init() {
        self.s = Holder{ data: beginCell().storeUint(0, 1).endCell().asSlice() };
    }
}