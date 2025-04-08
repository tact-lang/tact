struct InnerAddressOpt {
    addrVal: Address?;
}

contract AddressOptionalNested {
    val: InnerAddressOpt;

    init() {
        self.val = InnerAddressOpt{
            addrVal: null,
        };
    }
}