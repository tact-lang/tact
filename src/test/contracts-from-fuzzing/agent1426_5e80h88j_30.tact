struct StructWithAddress {
    addr: Address;
    someInt: Int;
}

contract AddressStructTest {
    s: StructWithAddress;

    init() {
        self.s = StructWithAddress{
            addr: myAddress(),
            someInt: 42
        };
    }
}