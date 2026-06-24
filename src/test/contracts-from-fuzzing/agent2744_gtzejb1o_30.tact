struct OptionalAddress {
    addr: Address?;
}

contract AddrOptTest {
    foo: OptionalAddress;

    init() {
        self.foo = OptionalAddress{
            addr: null
        };
    }
}
