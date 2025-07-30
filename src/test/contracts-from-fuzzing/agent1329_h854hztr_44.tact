struct OptAddress {
    addr: Address?;
}

contract TestOptAddress {
    v: OptAddress;

    init() {
        self.v = OptAddress{ addr: null };
    }
}
