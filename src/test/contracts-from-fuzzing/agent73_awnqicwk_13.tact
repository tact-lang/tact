struct AddressBundle {
    addr1: Address;
    addr2: Address;
    flag: Bool;
}

contract AddrTest {
    bundle: AddressBundle;
    init() {
        self.bundle = AddressBundle{
            addr1: myAddress(),
            addr2: myAddress(),
            flag: true
        };
    }
}