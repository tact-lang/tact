struct OptionalAddress {
    a: Address?;
}

contract TestContract {
    optAddr: OptionalAddress;

    init() {
        self.optAddr = OptionalAddress{ a: null };
    }
}