struct AddrStruct {
    addr: Address;
    text: String;
}

contract AddrInStructField {
    d: AddrStruct;
    num: Int;

    init() {
        self.d = AddrStruct{
            addr: myAddress(),
            text: "test"
        };
        self.num = 3;
    }
}