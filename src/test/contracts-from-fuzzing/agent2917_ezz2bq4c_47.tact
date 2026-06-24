struct OptionalAddressStruct {
    a: Address?;
}

contract StructOptionalAddressField {
    sa: OptionalAddressStruct;

    init() {
        self.sa = OptionalAddressStruct{a: null};
    }
}
