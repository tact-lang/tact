// test address and slice persistence
contract TestContract {
    addr: Address;
    optAddr: Address? = null;
    s: Slice;
    optSlice: Slice? = null;

    init() {
        self.addr = myAddress();
        self.s = emptyCell().asSlice();
    }
}