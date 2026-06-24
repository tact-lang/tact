struct OptionalAddress {
    addr: Address?;
}

contract OptionalAddrContract {
    a: OptionalAddress;

    init() {
        self.a = OptionalAddress{ addr: null };
    }
}
