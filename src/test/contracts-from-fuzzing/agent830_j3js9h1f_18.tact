struct HasAddress {
    addr: Address;
    optAddr: Address?;
}

contract TestAddress {
    data: HasAddress;

    init() {
        self.data = HasAddress{
            addr: myAddress(),
            optAddr: null
        };
    }
}