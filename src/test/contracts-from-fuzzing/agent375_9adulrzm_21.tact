struct OptionalAddress {
    addr: Address?;
}

contract TestContract {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{
            addr: null
        };
    }
}
