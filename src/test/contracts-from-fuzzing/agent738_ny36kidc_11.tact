struct AddrOptStruct {
    addr: Address?;
}

contract AddrOptPersistent {
    field: AddrOptStruct;
    alt: AddrOptStruct?;

    init() {
        self.field = AddrOptStruct{ addr: null };
        self.alt = null;
    }
}