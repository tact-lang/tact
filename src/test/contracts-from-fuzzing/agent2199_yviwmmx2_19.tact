struct ComposeAddress 
{
    addr: Address;
    chain: Int;
}

struct HigherLevel {
    info: ComposeAddress;
    flag: Bool;
}

contract ContractAddrComb {
    data: HigherLevel;
    init() {
        self.data = HigherLevel {
            info: ComposeAddress{addr: myAddress(), chain: 0},
            flag: true
        };
    }
}
