struct AddressMix {
    a1: Address;
    a2: Address?;
    a3: Address;
    a4: Address?;
}

contract TestContract {
    mix: AddressMix;
    init() {
        self.mix = AddressMix{
            a1: myAddress(),
            a2: null,
            a3: myAddress(),
            a4: null,
        };
    }
}