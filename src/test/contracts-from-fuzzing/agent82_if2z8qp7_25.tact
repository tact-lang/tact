struct AddrOpt {
    a1: Address?;
    a2: Address?;
}

contract Test {
    data: AddrOpt;

    init() {
        self.data = AddrOpt{
            a1: null,
            a2: myAddress()
        };
    }
}