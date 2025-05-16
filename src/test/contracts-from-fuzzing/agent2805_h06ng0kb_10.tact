struct AddressHolder {
    a1: Address;
    a2: Address;
}

contract AddrStorage {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{
            a1: myAddress(),
            a2: myAddress()
        };
    }
}