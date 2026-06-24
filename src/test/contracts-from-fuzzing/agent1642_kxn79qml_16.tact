struct OptionalStringAddr {
    s: String?;
    a: Address?;
}

contract OptStrAddr {
    data: OptionalStringAddr;

    init() {
        self.data = OptionalStringAddr{
            s: null,
            a: null
        };
    }
}