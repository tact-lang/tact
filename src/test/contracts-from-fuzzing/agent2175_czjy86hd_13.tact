struct AddressHolder {
    addr: Address;
}

contract StoreAddress {
    data: AddressHolder;
    
    init() {
        self.data = AddressHolder{ addr: myAddress() };
    }
}