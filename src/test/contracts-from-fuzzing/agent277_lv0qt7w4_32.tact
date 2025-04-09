struct AddressStruct {
    owner: Address;
    maybeRecipient: Address?;
}
contract Test {
    addrData: AddressStruct;
    init() {
        self.addrData = AddressStruct{
            owner: myAddress(),
            maybeRecipient: null
        };
    }
}