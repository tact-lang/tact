contract ContractWithAddress {
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}
