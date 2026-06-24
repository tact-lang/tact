struct HasAddress {
    addr: Address;
    optAddr: Address?;
    intVal: Int;
}

contract Test {
    data: HasAddress;
    init() {
        self.data = HasAddress{
            addr: myAddress(),
            optAddr: null,
            intVal: 5
        };
    }
}