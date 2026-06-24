struct OptAddr {
    a: Address?;
}

contract OptionalAddressField {
    a: Address?;
    s: OptAddr;

    init() {
        self.a = null;
        self.s = OptAddr{ a: null };
    }
}