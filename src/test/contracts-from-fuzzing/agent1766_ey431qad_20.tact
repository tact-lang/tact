struct AddressHolder {
    addr: Address;
}

contract HoldsAddress {
    field: AddressHolder;

    init() {
        self.field = AddressHolder{
            addr: myAddress()
        };
    }
}
