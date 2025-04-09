struct AddrStruct { a: Address }

contract AddrExample {
    f: AddrStruct;
    init() {
        self.f = AddrStruct{a: myAddress()};
    }
}