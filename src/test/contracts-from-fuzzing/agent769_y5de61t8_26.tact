struct AddressStuff {
    addr: Address;
    optAddr: Address?;
}

contract AddressTest {
    data: AddressStuff;
    init() {
        self.data = AddressStuff{
            addr: myAddress(),
            optAddr: null
        };
    }
}