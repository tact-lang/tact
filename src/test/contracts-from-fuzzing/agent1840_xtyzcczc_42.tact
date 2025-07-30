struct AddrWrapOpt {
    addr: Address?;
    b: Bool;
}

contract AddrOptTest {
    st: AddrWrapOpt;
    init() {
        self.st = AddrWrapOpt{ addr: null, b:true };
    }
}