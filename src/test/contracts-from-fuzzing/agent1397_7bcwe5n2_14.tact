struct OptionalAddr {
    a: Address?;
    b: Address?;
}

contract TestContract {
    addrs: OptionalAddr;

    init() {
        self.addrs = OptionalAddr{
            a: null,
            b: myAddress(),
        };
    }

    receive() {
        let _ = self.addrs.a;
        let _ = self.addrs.b;
    }
}