struct AddrStrOpt {
    addr: Address?;
    str: String;
}

contract AddrStrContractOpt {
    data: AddrStrOpt;

    init() {
        self.data = AddrStrOpt{
            addr: null,
            str: "hello"
        };
    }
}