struct AddressStruct {
    addr: Address;
}

contract AddressField {
    val: AddressStruct;
    init() {
        self.val = AddressStruct{ addr: myAddress() };
    }
}