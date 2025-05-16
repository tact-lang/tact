struct AddressHolder {
    addr: Address;
    optAddr: Address?;
}

contract Test {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{ addr: myAddress(), optAddr: null };
    }
}