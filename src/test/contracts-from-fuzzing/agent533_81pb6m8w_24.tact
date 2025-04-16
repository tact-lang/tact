struct OptionalAddress {
    a: Address?;
}

contract Test {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{a: null};
    }
}