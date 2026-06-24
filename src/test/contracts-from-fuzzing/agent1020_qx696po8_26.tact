struct AddressStruct {
    a: Address;
    b: Bool;
    c: String;
}

contract AddressFieldTest {
    data: AddressStruct;

    init() {
        self.data = AddressStruct{
            a: myAddress(),
            b: true,
            c: "addr"
        };
    }
}