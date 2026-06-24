struct AddressStruct {
    addr1: Address;
    addr2: Address?;
    addr3: Address;
}

contract TestContract {
    ad: AddressStruct;

    init() {
        self.ad = AddressStruct{
            addr1: myAddress(),
            addr2: null,
            addr3: myAddress()
        };
    }
}