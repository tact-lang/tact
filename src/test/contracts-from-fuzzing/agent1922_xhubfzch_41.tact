struct HasAddr {
    addr: Address;
}

contract AddressStorage {
    val: HasAddr;

    init() {
        self.val = HasAddr{
            addr: myAddress()
        };
    }
}