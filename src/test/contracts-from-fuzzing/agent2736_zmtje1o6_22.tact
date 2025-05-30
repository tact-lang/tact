struct BigAggregate {
    int1: Int;
    int2: Int;
    int3: Int;
    str1: String;
    str2: String;
    str3: String;
    addr1: Address;
    addr2: Address;
    bool1: Bool;
    bool2: Bool;
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;
    optBool: Bool?;
}

contract BigStructTest {
    big: BigAggregate;

    init() {
        self.big = BigAggregate{
            int1:1, int2:2, int3:3,
            str1:"a",str2:"b",str3:"c",
            addr1: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            addr2: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            bool1:true, bool2:false,
            optInt:null,
            optStr:null,
            optAddr:null,
            optBool:null
        };
    }
}