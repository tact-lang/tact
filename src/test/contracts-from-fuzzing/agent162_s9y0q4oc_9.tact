struct HasAddress {
    addr: Address;
    maybeAddr: Address?;
    someText: String;
}

contract TestContract {
    data: HasAddress;

    init() {
        self.data = HasAddress{
            addr: myAddress(),
            maybeAddr: null,
            someText: "address"
        };
    }
}