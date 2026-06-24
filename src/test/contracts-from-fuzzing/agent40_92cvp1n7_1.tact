struct AddressWrapper {
    wrappedAddress: Address;
}

contract TestContract {
    addrWrapper: AddressWrapper;

    init() {
        self.addrWrapper = AddressWrapper{wrappedAddress: myAddress()};
    }
}