struct AddressNested {
    addr: Address;
    optAddr: Address?;
}

struct ContainsAddress {
    s: AddressNested;
    t: Address?;
}

contract AddressMix {
    f: ContainsAddress;
    init() {
        self.f = ContainsAddress{
            s: AddressNested{addr: myAddress(), optAddr: null}, t: null
        };
    }
}