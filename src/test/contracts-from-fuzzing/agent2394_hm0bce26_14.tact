struct BigNested {
    str1: String;
    str2: String;
    int1: Int;
    int2: Int;
    addr1: Address;
    addr2: Address;
    bool1: Bool;
    bool2: Bool;
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;
    optBool: Bool?;
}

contract BigStructField {
    bn: BigNested;

    init() {
        self.bn = BigNested{
            str1: "a",
            str2: "b",
            int1: 1,
            int2: 2,
            addr1: myAddress(),
            addr2: myAddress(),
            bool1: true,
            bool2: false,
            optInt: null,
            optStr: null,
            optAddr: null,
            optBool: null
        };
    }
}
