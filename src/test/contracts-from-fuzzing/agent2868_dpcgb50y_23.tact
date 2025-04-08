struct OptionalAddress {
    addr: Address?;
}

contract OptAddrStorage {
    val: OptionalAddress;

    init() {
        self.val = OptionalAddress{};
    }
}