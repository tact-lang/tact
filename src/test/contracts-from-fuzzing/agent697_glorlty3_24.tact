struct WithAddress {
    owner: Address;
    recipient: Address?;
}

contract UtilizeAddress {
    data: WithAddress;

    init() {
        self.data = WithAddress{
            owner: myAddress(),
            recipient: null
        };
    }
}