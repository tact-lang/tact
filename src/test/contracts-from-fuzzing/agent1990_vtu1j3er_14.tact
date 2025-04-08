struct AddressTest {
    addr: Address;
    addrOpt: Address?;
}

contract AddressPersist {
    d: AddressTest;

    init() {
        self.d = AddressTest{
            addr: myAddress(),
            addrOpt: null
        };
    }
}
