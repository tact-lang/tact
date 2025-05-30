struct StructWithAddress {
    addr: Address;
}

contract TestContract {
    info: StructWithAddress;

    init() {
        self.info = StructWithAddress{addr: myAddress()};
    }
}