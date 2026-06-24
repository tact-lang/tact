struct OptionalAddress {
    addr: Address?;
}

contract OptionalAddressField {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{
            addr: null
        };
    }
}