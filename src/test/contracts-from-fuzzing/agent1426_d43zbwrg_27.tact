struct AddressContainer {
    a: Address;
}

contract AddressStorage {
    addr: AddressContainer;

    init() {
        self.addr = AddressContainer{
            a: myAddress()
        };
    }
}