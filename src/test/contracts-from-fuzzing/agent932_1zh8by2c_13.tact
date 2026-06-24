struct OptionalStringAddress {
    a: String?;
    b: Address?;
    c: Bool?;
}

contract OptionalStructs {
    data: OptionalStringAddress;

    init() {
        self.data = OptionalStringAddress{
            a: null,
            b: null,
            c: true
        };
    }
}
