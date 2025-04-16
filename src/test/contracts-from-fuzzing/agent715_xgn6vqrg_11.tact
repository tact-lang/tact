struct AddressOptional {
    maybeOwner: Address?;
    maybeAdmin: Address?;
}

contract TestContract {
    roles: AddressOptional;

    init() {
        self.roles = AddressOptional{
            maybeOwner: myAddress(),
            maybeAdmin: null
        };
    }
}