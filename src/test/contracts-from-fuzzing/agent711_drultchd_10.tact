struct AddressPack {
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract TestContract {
    addresses: AddressPack;

    init() {
        self.addresses = AddressPack{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress(),
        };
    }
}