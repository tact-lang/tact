struct AddressHolder {
    a1: Address;
    a2: Address?;
    a3: Address;
    a4: Address?;
}

contract AddressMix {
    field: AddressHolder;

    init() {
        self.field = AddressHolder{
            a1: myAddress(),
            a2: null,
            a3: myAddress(),
            a4: null
        };
    }
}
