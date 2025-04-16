struct AddrAndOpt {
    addr: Address;
    opt: Int?;
}

contract AddrOptTest {
    store: AddrAndOpt;

    init() {
        self.store = AddrAndOpt{
            addr: myAddress(),
            opt: 42
        };
    }
}