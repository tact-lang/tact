struct AddressHolder {
    addr: Address;
}

contract AddressNestedTest {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{addr: myAddress()};
    }
}