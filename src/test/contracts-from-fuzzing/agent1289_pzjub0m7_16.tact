struct OptAddressString {
    addr: Address?;
    text: String?;
}

contract OptionalAddressStringTest {
    nested: OptAddressString;

    init() {
        self.nested = OptAddressString{
            addr: null,
            text: null
        };
    }
}