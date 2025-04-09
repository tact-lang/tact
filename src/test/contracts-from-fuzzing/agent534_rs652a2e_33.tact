struct OptionalAddressWrap {
    addressO: Address?;
}

contract OptAddressWrapTest {
    wrapper: OptionalAddressWrap;

    init() {
        self.wrapper = OptionalAddressWrap{
            addressO: null
        };
    }
}