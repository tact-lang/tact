struct AddressHolder {
    owner: Address;
    backup: Address?;
}

contract AddressStorage {
    addr: AddressHolder;

    init() {
        self.addr = AddressHolder{
            owner: myAddress(),
            backup: null
        };
    }
}