struct IntAndAddress {
    number: Int;
    addr: Address;
}

contract AddressFieldContract {
    data: IntAndAddress;

    init() {
        self.data = IntAndAddress{
            number: 555,
            addr: myAddress()
        };
    }
}