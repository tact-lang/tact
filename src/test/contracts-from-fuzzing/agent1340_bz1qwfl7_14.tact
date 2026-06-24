contract AddressStorage {
    addr1: Address;
    addr2: Address?;

    init() {
        self.addr1 = myAddress();
        self.addr2 = null;
    }
}