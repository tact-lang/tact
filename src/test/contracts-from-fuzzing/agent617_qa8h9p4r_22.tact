struct OptionalAddr {
    addr: Address?;
}

contract OptAddress {
    data: OptionalAddr;
    init() {
        self.data = OptionalAddr{
            addr: null
        };
    }
}