struct OptionalAddressField {
    addr: Address?;
}

contract OptAddrTest {
    val: OptionalAddressField;

    init() {
        self.val = OptionalAddressField{ addr: null };
    }
}