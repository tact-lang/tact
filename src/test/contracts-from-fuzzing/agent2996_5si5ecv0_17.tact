struct OptionalAddress {
    maybeAddr: Address?;
}

contract OptAddr {
    myopt: OptionalAddress;

    init() {
        self.myopt = OptionalAddress{ maybeAddr: null };
    }
}