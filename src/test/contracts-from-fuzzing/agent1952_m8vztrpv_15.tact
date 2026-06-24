struct OptionalAddress {
    a: Address?;
}

contract TestContract {
    addr: OptionalAddress;

    init() {
        self.addr = OptionalAddress{
            a: null,
        };
    }
}
