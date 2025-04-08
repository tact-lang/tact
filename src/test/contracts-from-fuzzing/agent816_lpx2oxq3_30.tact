struct WrapAddr {
    addr: Address;
}

contract WrapAddrTest {
    v: WrapAddr;

    init() {
        self.v = WrapAddr{
            addr: myAddress()
        };
    }
}
