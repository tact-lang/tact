struct WithAddress {
    addr: Address;
    name: String;
}

contract StructWithAddress {
    x: WithAddress;

    init() {
        self.x = WithAddress{
            addr: myAddress(),
            name: "Foo",
        };
    }
}