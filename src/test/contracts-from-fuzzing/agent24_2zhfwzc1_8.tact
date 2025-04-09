struct OptionalAddressString {
    owner: Address?;
    description: String?;
}

contract OptionalCompositeTest {
    meta: OptionalAddressString;

    init() {
        self.meta = OptionalAddressString{
            owner: null,
            description: null,
        };
    }
}