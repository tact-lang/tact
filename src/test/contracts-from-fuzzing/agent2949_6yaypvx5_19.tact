struct WithAddress {
    addr: Address;
}

contract OptionalAddrStruct {
    data: WithAddress?;

    init() {
        self.data = null;
    }
}
