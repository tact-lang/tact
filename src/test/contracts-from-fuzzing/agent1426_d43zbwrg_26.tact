struct OptAddr {
    a: Address?;
    b: Int?;
    c: Bool?;
}

contract OptAddrContract {
    store: OptAddr;

    init() {
        self.store = OptAddr{
            a: null,
            b: null,
            c: null
        };
    }
}