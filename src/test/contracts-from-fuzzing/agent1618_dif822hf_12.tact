struct AddressOptionals {
    a: Address?;
    b: Address?;
}

contract TestContract {
    data: AddressOptionals;

    init() {
        self.data = AddressOptionals{
            a: null,
            b: myAddress()
        };
    }
}