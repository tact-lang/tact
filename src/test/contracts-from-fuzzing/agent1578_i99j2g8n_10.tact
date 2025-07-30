struct WithStringAndAddress {
    txt: String;
    addr: Address;
}

contract TestContract {
    s: WithStringAndAddress;

    init() {
        self.s = WithStringAndAddress{
            txt: "hello",
            addr: myAddress()
        };
    }
}