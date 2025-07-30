struct HasAddress {
    addr: Address;
}

contract OptionalStructAddr {
    s: HasAddress?;

    init() {
        self.s = null;
    }
}