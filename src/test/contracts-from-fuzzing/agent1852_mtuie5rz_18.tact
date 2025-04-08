struct AddressLayer {
    a: Address;
    b: Address;
}

struct BoolLayer {
    x: Bool;
    y: Bool;
}

struct Wrapper {
    addresses: AddressLayer;
    bools: BoolLayer;
}

contract MixedLayers {
    wrapped: Wrapper;

    init() {
        self.wrapped = Wrapper{
            addresses: AddressLayer{a: myAddress(), b: myAddress()},
            bools: BoolLayer{x: true, y: false}
        };
    }
}