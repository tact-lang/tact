struct AddrInner {
    addr: Address?;
}

struct AddrContainer {
    owner: Address;
    nested: AddrInner;
}

contract TestContract {
    data: AddrContainer;

    init() {
        self.data = AddrContainer{
            owner: myAddress(),
            nested: AddrInner{ addr: null }
        };
    }
}