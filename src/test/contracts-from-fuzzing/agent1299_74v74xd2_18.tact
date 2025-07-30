struct AddressStringStruct {
    addr: Address;
    str: String;
}

contract MultiPrimitiveHolder {
    data: AddressStringStruct;

    init() {
        self.data = AddressStringStruct{
            addr: myAddress(),
            str: "string data",
        };
    }
}
