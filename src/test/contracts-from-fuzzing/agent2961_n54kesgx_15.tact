struct OptAddr {
    a: Address?;
    s: String?;
}

contract OptAddressStruct {
    d: OptAddr;
    init() {
        self.d = OptAddr{ a: null, s: null };
    }
}