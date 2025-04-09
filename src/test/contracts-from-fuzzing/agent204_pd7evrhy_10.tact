struct AddressStruct {
    addr: Address;
    owner: Address;
}

contract AddressTest {
    info: AddressStruct;

    init() {
        self.info = AddressStruct{
            addr: myAddress(),
            owner: myAddress()
        };
    }

    receive() {
        self.info = AddressStruct{
            addr: self.info.owner,
            owner: self.info.addr
        };
    }
}