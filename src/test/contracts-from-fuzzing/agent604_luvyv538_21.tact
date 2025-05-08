struct AddressWrapper {
    addr: Address?;
}

contract AddrWrapContract {
    x: AddressWrapper;

    init() {
        self.x = AddressWrapper{ addr: null };
    }
}