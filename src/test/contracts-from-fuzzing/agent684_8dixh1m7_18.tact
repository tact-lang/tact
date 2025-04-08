struct OptionalAddress {
    addr: Address?;
}

contract OptAddrTest {
    field: OptionalAddress;
    init() {
        self.field = OptionalAddress { addr: null };
    }
}