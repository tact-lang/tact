struct AddrStruct {
    addr: Address;
}

contract Test18 {
    s: AddrStruct;

    init() {
        self.s = AddrStruct{
            addr: myAddress(),
        };
    }

    receive() {}
}