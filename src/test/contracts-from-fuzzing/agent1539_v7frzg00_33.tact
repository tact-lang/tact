struct WrapAddr {
    a: Address;
}

contract AddrWrapper {
    val: WrapAddr;
    init() {
        self.val = WrapAddr{a:myAddress()};
    }
}