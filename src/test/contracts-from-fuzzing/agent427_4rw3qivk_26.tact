struct OptionalAddress {
    addr: Address?;
}

contract PersistOptAddress {
    foo: OptionalAddress;

    init() {
        self.foo = OptionalAddress{
            addr: null
        };
    }
}