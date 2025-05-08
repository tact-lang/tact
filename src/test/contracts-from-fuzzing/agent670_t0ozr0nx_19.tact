struct HasAddress {
    addr: Address;
}

contract TestContract {
    data: HasAddress;

    init() {
        self.data = HasAddress{
            addr: myAddress(),
        };
    }
}