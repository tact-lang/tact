struct AddressString {
    address: Address;
    text: String;
}

contract AddrStringWrapper {
    data: AddressString;

    init() {
        self.data = AddressString{ address: myAddress(), text: "hi" };
    }
}