struct WrapAddress {
    addr: Address;
}

contract StoreAddress {
    wrap: WrapAddress;
    init() {
        self.wrap = WrapAddress{ addr: myAddress() };
    }
}