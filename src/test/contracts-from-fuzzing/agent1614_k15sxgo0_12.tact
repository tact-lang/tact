struct OptionalAddress {
    addr: Address?;
}

contract Test12 {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{addr: null};
    }
}