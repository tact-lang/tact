struct AddressHolder {
    addr: Address;
}

contract TestContract {
    holder: AddressHolder;

    init() {
        self.holder = AddressHolder{
            addr: myAddress()
        };
    }
}