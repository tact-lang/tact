struct OptionalAddress {
    foo: Address?;
}

contract OptAddressContract {
    val: OptionalAddress;

    init() {
        self.val = OptionalAddress{ foo: null };
    }
}