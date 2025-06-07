struct OptionalAddress {
    addr: Address?;
    comment: String;
}

contract TestOptionalAddress {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{
            addr: null,
            comment: "hi"
        };
    }
}
