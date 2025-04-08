struct OptionalAddr {
    a: Address?;
    b: Address?;
}

contract TestContract {
    optAddrs: OptionalAddr;

    init() {
        self.optAddrs = OptionalAddr {
            a: null,
            b: null
        };
    }
}