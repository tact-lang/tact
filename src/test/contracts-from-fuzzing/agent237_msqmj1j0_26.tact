struct AddrWrap {
    a: Address;
}

struct AddrOptWrap {
    a: Address?;
}

contract AddrNullCombo {
    a1: AddrWrap;
    a2: AddrOptWrap;
    init() {
        self.a1 = AddrWrap{a: myAddress()};
        self.a2 = AddrOptWrap{a: null};
    }
}