struct AddressHolder {
    addr: Address;
    optAddr: Address?;
}

contract AddressesPersistent {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{
            addr: myAddress(),
            optAddr: null
        };
    }
}