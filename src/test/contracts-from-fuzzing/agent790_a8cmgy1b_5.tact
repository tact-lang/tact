struct OptionalAddress {
    addr: Address?;
}

contract OptionalStructWithOptionalField {
    data: OptionalAddress?;

    init() {
        self.data = null;
    }
}
