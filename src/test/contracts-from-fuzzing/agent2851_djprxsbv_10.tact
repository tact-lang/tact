contract ContractWithAddressAndSlice {
    addr: Address;
    sl: Slice;

    init() {
        self.addr = myAddress();
        self.sl = emptyCell().asSlice();
    }
}
