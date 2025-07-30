struct OptionalStringAddr {
    s: String?;
    a: Address?;
}

contract OptionalStringAddress {
    data: OptionalStringAddr;

    init() {
        self.data = OptionalStringAddr{
            s: null,
            a: null,
        };
    }
}