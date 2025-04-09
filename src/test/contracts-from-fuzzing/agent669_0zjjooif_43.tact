struct AddressNest {
    addr: Address;
}

contract ContainsAddress {
    field: AddressNest;

    init() {
        self.field = AddressNest{ addr: myAddress() };
    }
}