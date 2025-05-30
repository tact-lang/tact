contract ContractWithoutDefault {
    addrVal: Address;

    init() {
        self.addrVal = myAddress();
    }
}
