struct AddressOptionals {
    a: Address?;
    b: Address;
}

contract AddressOptTest {
    f: AddressOptionals;

    init() {
        self.f = AddressOptionals{ a: null, b: myAddress() };
    }
}