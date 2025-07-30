struct BigStruct {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    addr1: Address;
    addr2: Address;
}

contract BigStructStorage {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            int1: 1,
            int2: 2,
            int3: 3,
            int4: 4,
            int5: 5,
            bool1: true,
            bool2: false,
            bool3: true,
            addr1: myAddress(),
            addr2: myAddress()
        };
    }
}