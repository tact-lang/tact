struct AddressPair {
    addr1: Address;
    addr2: Address;
}

contract TestContract {
    pair: AddressPair;

    init() {
        self.pair = AddressPair{
            addr1: myAddress(),
            addr2: myAddress(),
        };
    }
}