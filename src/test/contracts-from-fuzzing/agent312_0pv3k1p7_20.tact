struct HasAddress {
    addr: Address;
    maybeAddr: Address?;
}

contract AddressStructTest {
    val: HasAddress;

    init() {
        self.val = HasAddress{ addr: myAddress(), maybeAddr: null };
    }
}