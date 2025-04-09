struct AddressHolder {
    addr: Address;
    flag: Bool;
}

contract AddressStorage {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{
            addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            flag: true
        };
    }
}
