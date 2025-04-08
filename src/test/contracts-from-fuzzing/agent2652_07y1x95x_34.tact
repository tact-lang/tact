struct WrappedAddr {
    addr: Address;
}

struct WrapOpt {
    inner: WrappedAddr?;
}

contract NestedAddrOptional {
    s: WrapOpt;
    init() {
        self.s = WrapOpt{ inner: WrappedAddr{ addr: myAddress() } };
    }
}