struct OptionalAddress {
    addr: Address?;
}

contract TestContract {
    oaddr: OptionalAddress;
    init() {
        self.oaddr = OptionalAddress{ addr: null };
    }
}