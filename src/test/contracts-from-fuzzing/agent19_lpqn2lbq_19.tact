struct OptionalAddr {
    a: Address?;
}

contract TestContract {
    addr: OptionalAddr;

    init() {
        self.addr = OptionalAddr{a: null};
    }
}