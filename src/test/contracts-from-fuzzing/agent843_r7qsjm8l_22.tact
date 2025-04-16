struct InnerAddr {
    addr: Address;
}

struct Mid {
    inner: InnerAddr;
}

struct Top {
    mid: Mid;
}

contract DeepAddrContract {
    nestedAddr: Top;

    init() {
        self.nestedAddr = Top{
            mid: Mid{ inner: InnerAddr{ addr: myAddress() } }
        };
    }
}