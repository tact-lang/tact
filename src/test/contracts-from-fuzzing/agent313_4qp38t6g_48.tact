struct AddressStringInt {
    addr: Address;
    label: String;
    number: Int;
}

contract CrossTypeFieldContract {
    data: AddressStringInt;

    init() {
        self.data = AddressStringInt{
            addr: myAddress(),
            label: "test",
            number: 42
        };
    }
}