struct StructWithAddress {
    owner: Address;
    backup: Address?;
}

contract AddressFieldsContract {
    info: StructWithAddress;

    init() {
        self.info = StructWithAddress{
            owner: myAddress(),
            backup: null,
        };
    }
}