struct AddressStringWrap {
    addr: Address;
    text: String;
}

contract StringAndAddress {
    a: AddressStringWrap;

    init() {
        self.a = AddressStringWrap { addr: myAddress(), text: "abc" };
    }
}