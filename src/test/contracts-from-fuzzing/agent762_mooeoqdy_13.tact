struct AddressStruct {
    addr1: Address;
    addr2: Address;
    addr3: Address;
    optAddr: Address?;
}

contract TestContract {
    s: AddressStruct;
    init() {
        self.s = AddressStruct{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress(),
            optAddr: null
        };
    }
    receive() {
        self.s = AddressStruct{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress(),
            optAddr: myAddress()
        };
    }
}