struct OptionalAddress {
    addr: Address?;
}

contract OptAddressContract {
    a: OptionalAddress;

    init() {
        self.a = OptionalAddress{
            addr: null
        };
    }
}