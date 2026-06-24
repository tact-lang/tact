struct InnerAddr {
    addr: Address?;
}

struct OuterAddrOpt {
    i: InnerAddr;
    flag: Bool = true;
}

contract OptAddrNested {
    data: OuterAddrOpt;

    init() {
        self.data = OuterAddrOpt{
            i: InnerAddr{ addr: null },
            flag: false
        };
    }
}