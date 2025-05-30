struct AddressPair {
    aa: Address;
    bb: Address;
}

struct Complex {
    num: Int;
    nested: AddressPair;
    text: String;
    flag: Bool;
}

contract AddressTest {
    c: Complex;

    init() {
        self.c = Complex{
            num: 12,
            nested: AddressPair{ aa: myAddress(), bb: myAddress() },
            text: "hi",
            flag: false
        };
    }
}