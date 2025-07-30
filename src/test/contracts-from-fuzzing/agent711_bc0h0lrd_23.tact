struct SOptAddress {
    a: Address?;
    b: Address;
}

contract OptionalAddressStruct {
    data: SOptAddress;

    init(){
        self.data = SOptAddress{
            a: null,
            b: myAddress()
        };
    }
}
