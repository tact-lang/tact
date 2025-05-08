struct AddressHolder {
    a: Address;
}

contract AddressStructField {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{ a: myAddress() };
    }
}
