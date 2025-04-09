struct HasAddress {
    addr: Address;
}

struct Holding {
    nested: HasAddress;
    text: String;
}

contract StorageAddrs {
    param: Holding;

    init() {
        self.param = Holding{
            nested: HasAddress{
                addr: myAddress(),
            },
            text: "Test",
        };
    }
}
