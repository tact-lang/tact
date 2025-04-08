struct NestedAddrOpt {
    addr1: Address?;
    addr2: Address?;
}

contract AddrWrap {
    n: NestedAddrOpt;

    init() {
        self.n = NestedAddrOpt{
            addr1:null,
            addr2:null
        };
    }
}