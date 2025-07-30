struct AddressMix {
    addr1: Address;
    addr2: Address?;
    addr3: Address;
    addr4: Address?;
}

struct IntMix {
    i1: Int;
    i2: Int?;
    i3: Int;
    i4: Int?;
}

contract MixedStorage {
    a: AddressMix;
    b: IntMix;

    init() {
        self.a = AddressMix{addr1: myAddress(), addr2: null, addr3: myAddress(), addr4: null};
        self.b = IntMix{i1: 1, i2: null, i3: 2, i4: null};
    }
}
