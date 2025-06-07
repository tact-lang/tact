trait Base {
    addr: Address;
}

struct SubStruct {
    nestedAddr: Address;
    flag: Bool;
}

contract TraitsAndStructs with Base {
    addr: Address;
    sub: SubStruct;
    init() {
        self.addr = myAddress();
        self.sub = SubStruct{ nestedAddr: myAddress(), flag: true };
    }
}