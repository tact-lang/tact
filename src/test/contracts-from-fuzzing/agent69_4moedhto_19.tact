struct AddressOptional {
    a: Address?;
    b: Int?;
}

contract AddressOptionalTest {
    addrOpt: AddressOptional;

    init() {
        self.addrOpt = AddressOptional{
            a: null,
            b: null
        };
    }
}