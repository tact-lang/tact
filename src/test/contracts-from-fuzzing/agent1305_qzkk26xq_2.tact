struct BigStruct {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    str1: String;
    str2: String;
    str3: String;
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            int1: 1, int2: 2, int3: 3, int4: 4, int5: 5,
            bool1: true, bool2: false, bool3: true,
            str1: "one", str2: "two", str3: "three",
            addr1: myAddress(), addr2: myAddress(),
            cell1: emptyCell(), cell2: emptyCell(),
        };
    }
}