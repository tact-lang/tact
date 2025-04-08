struct WithAddress {
    addr: Address;
    txt: String;
}

contract AddressText {
    data: WithAddress;

    init() {
        self.data = WithAddress{
            addr: myAddress(),
            txt: "abc"
        };
    }
}