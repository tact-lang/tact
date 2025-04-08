struct OptAddr {
    a: Address?;
    str: String;
}

contract OptionalAddress {
    data: OptAddr;

    init() {
        self.data = OptAddr{ a: null, str: "x" };
    }
}