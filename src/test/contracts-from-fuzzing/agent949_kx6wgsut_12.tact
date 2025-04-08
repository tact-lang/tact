struct AddressStruct {
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract AddressTest {
    data: AddressStruct;

    init() {
        let a = myAddress();
        self.data = AddressStruct{
            addr1: a,
            addr2: a,
            addr3: a
        };
    }
}
