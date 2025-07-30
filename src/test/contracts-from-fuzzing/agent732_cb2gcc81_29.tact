struct SerializeAddress {
    addr: Address;
    maybeAddr: Address?;
}

contract SerializeAddressTest {
    a: SerializeAddress;

    init() {
        self.a = SerializeAddress{
            addr: myAddress(),
            maybeAddr: null
        };
    }
}