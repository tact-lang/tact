struct OptAddr {
    val: Address?;
}

contract OptionalAddress {
    f: OptAddr;

    init() {
        self.f = OptAddr{ val: null };
    }
}