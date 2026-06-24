struct OptionalAddress {
    addr: Address?;
}

contract OptionalAddrStorage {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{ addr: null };
    }
}