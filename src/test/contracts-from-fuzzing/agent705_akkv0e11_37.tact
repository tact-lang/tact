struct AddressBool {
    addr: Address;
    flag: Bool;
}

contract AddrBoolWrap {
    ab: AddressBool;

    init() {
        self.ab = AddressBool{ addr: myAddress(), flag: true };
    }
}