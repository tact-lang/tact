struct HasAddr {
    addr: Address;
}

struct Top {
    h: HasAddr;
}

contract NestedAddressTest {
    value: Top;

    init() {
        self.value = Top{h: HasAddr{addr: myAddress()}};
    }
}