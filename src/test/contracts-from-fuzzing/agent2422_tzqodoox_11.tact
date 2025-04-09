struct WrappedAddress {
    addr: Address;
}

struct OptionalWrapper {
    wrapped: WrappedAddress?;
}

contract DeepOptAddrTest {
    state: OptionalWrapper;
    init() {
        self.state = OptionalWrapper{ wrapped: null };
    }
}