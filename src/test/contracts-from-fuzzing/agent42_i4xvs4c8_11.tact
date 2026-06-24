struct HasBool {
    flag: Bool;
}

struct HasAddress {
    addr: Address;
}

struct HasString {
    text: String;
}

contract MultiTypeNested {
    flagStruct: HasBool;
    addrStruct: HasAddress;
    strStruct: HasString;

    init() {
        self.flagStruct = HasBool{flag: true};
        self.addrStruct = HasAddress{addr: myAddress()};
        self.strStruct = HasString{text: "abc"};
    }
}