struct AddrHolder {
    addr: Address;
}

struct Wrap {
    inner: AddrHolder?;
}

contract OptAddrHolderTest {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            inner: AddrHolder{ addr: myAddress() },
        };
    }
}