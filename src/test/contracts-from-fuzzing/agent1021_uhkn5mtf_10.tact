// extremely long struct with varying types, no maps!
struct Jumbo {
    int1: Int;
    bool1: Bool;
    str1: String;
    addr1: Address;
    slice1: Slice;
    int2: Int;
    bool2: Bool;
    str2: String;
    addr2: Address;
    slice2: Slice;
    int3: Int;
    bool3: Bool;
    str3: String;
    addr3: Address;
    slice3: Slice;
    int4: Int;
    bool4: Bool;
    str4: String;
    addr4: Address;
    slice4: Slice;
}

contract BigMix {
    data: Jumbo;

    init() {
        self.data = Jumbo{
            int1: 1, bool1: true, str1: "a", addr1: myAddress(), slice1: emptyCell().asSlice(),
            int2: 2, bool2: false, str2: "b", addr2: myAddress(), slice2: emptyCell().asSlice(),
            int3: 3, bool3: true, str3: "c", addr3: myAddress(), slice3: emptyCell().asSlice(),
            int4: 4, bool4: false, str4: "d", addr4: myAddress(), slice4: emptyCell().asSlice(),
        };
    }
}