struct AddressWrapper {
    addr1: Address;
    addr2: Address?;
}

contract TestContract {
    s: AddressWrapper;

    init() {
        self.s = AddressWrapper{
            addr1: myAddress(),
            addr2: null
        };
    }
}