struct OptAddr {
    addr: Address?;
}

contract OptionalAddress {
    param: OptAddr;

    init() {
        self.param = OptAddr { addr: null };
    }
}