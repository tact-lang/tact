struct AddressString {
    addr: Address;
    s: String;
}

contract AddressStringTest {
    data: AddressString;

    init() {
        self.data = AddressString{
            addr: myAddress(),
            s: "hello",
        };
    }
}