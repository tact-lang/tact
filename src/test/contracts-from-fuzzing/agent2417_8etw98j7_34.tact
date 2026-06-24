struct AddressLayer {
    addr: Address;
    innerOpt: Bool?;
}

contract AddressMix {
    layer: AddressLayer;

    init() {
        self.layer = AddressLayer{ addr: myAddress(), innerOpt: null };
    }
}
