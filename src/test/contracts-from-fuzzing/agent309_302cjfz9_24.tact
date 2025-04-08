struct AddressHolder {
    addr: Address;
    description: String;
}

contract AddressData {
    info: AddressHolder;

    init() {
        self.info = AddressHolder{ addr: myAddress(), description: "Self addr" };
    }
}