struct AddressHolder {
    addr: Address;
}

contract HoldsAddress {
    a: Address;
    b: Address?;
    sh: AddressHolder;

    init() {
        self.a = myAddress();
        self.b = null;
        self.sh = AddressHolder{ addr: myAddress() };
    }
}