struct OptAddr {
    addr: Address?;
    s: String;
}

contract OptionalAddress {
    f: OptAddr;

    init() {
        self.f = OptAddr{
            addr: null,
            s: "hi"
        };
    }
}
