struct AddressHolder {
    addr: Address;
}

contract Test18 {
    ah: AddressHolder;

    init() {
        self.ah = AddressHolder{ addr: myAddress() };
    }
}