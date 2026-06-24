struct WithAddress {
    addr: Address;
    val: Int;
}

contract StructWithAddress {
    field: WithAddress;

    init() {
        self.field = WithAddress{ addr: myAddress(), val: 4 };
    }
}
