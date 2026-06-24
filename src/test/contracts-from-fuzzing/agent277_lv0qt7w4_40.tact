struct StructWithAddress {
    addr: Address;
}

contract Test {
    sa: StructWithAddress;
    init() {
        self.sa = StructWithAddress{ addr: myAddress() };
    }
}