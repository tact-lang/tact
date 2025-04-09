struct HasAddress {
    addr: Address;
}

struct NestedAddr {
    inner: HasAddress;
    label: String;
}

contract NestedAddressContract {
    obj: NestedAddr;

    init() {
        self.obj = NestedAddr{
            inner: HasAddress{ addr: myAddress() },
            label: "test"
        };
    }
}