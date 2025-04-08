struct OptionAddr {
    first: Address?;
    second: Address?;
}

contract OptAddrInner {
    wrap: OptionAddr?;

    init() {
        self.wrap = null;
    }
}