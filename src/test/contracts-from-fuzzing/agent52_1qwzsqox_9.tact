struct AddressTest {
    addr1: Address;
    addr2: Address;
    optionalAddr: Address?;
}

contract TestContract {
    endpoints: AddressTest;

    init() {
        self.endpoints = AddressTest{
            addr1: myAddress(),
            addr2: myAddress(),
            optionalAddr: null
        };
    }
}
