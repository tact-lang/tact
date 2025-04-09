struct OptionalAddress {
    addr: Address?;
    flag: Bool;
}

contract OptionalAddressContract {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{
            addr: null,
            flag: false,
        };
    }
}
