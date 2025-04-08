struct LargePrimitive {
    int1: Int as int1;
    int257: Int as int257;
    uint1: Int as uint1;
    uint256: Int as uint256;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;
    addr1: Address;
    addr2: Address;
}

contract LargePrimitiveContract {
    inner: LargePrimitive;

    init() {
        self.inner = LargePrimitive{
            int1: 1,
            int257: -1,
            uint1: 1,
            uint256: 1,
            bool1: true,
            bool2: false,
            str1: "abc",
            str2: "xyz",
            addr1: myAddress(),
            addr2: myAddress()
        };
    }
}