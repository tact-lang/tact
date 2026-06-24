struct AddressHolder {
    a: Address;
    b: Address?;
}

contract TestContract {
    s: AddressHolder;

    init() {
        self.s = AddressHolder {
            a: myAddress(),
            b: null
        };
    }
}