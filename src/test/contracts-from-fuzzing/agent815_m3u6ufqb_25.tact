struct AddressStruct {
    addr: Address;
    str: String;
}

contract AddressStructStore {
    holder: AddressStruct;

    init() {
        self.holder = AddressStruct{
            addr: myAddress(),
            str: "hello"
        };
    }
}