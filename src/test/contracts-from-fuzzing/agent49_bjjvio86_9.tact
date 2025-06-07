struct AddressHolder {
    a: Address;
}

contract WithAddressField {
    addr: AddressHolder;

    init() {
        self.addr = AddressHolder{
            a: myAddress(),
        };
    }
}
