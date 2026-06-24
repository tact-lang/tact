struct StructWithAddress {
    addr: Address;
}

contract AddressStructField {
    s: StructWithAddress;

    init() {
        self.s = StructWithAddress{ addr: myAddress() };
    }
}