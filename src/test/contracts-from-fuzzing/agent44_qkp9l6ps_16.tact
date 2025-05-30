struct OptionalAddressString {
    addr: Address?;
    text: String?;
}

contract OptionalAddressStringTest {
    data: OptionalAddressString;

    init() {
        self.data = OptionalAddressString{
            addr: null,
            text: null,
        };
    }
}