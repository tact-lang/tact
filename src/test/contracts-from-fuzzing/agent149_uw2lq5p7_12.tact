struct ContainingAddr {
    addr: Address;
}

contract AddressStorage {
    info: ContainingAddr;

    init() {
        self.info = ContainingAddr{ addr: myAddress() };
    }
}