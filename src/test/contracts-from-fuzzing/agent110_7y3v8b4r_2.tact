struct NestedStruct {
    a: Int;
    b: Bool;
    addr: Address;
}

contract HasStruct {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{a: 1, b: true, addr: myAddress()};
    }
}