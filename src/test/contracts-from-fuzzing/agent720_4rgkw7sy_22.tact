struct AddressHolder {
    addr: Address;
}

contract AddressContract {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{
            addr: myAddress()
        };
    }
}