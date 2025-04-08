struct LargeStruct {
    // Fuzz: many primitive fields, diverse types
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    bool5: Bool;
    addr1: Address;
    addr2: Address;
    addr3: Address;
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;
    str1: String;
    str2: String;
}

contract LargeStructTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            int1: 1, int2: 2, int3: 3, int4: 4, int5: 5,
            bool1: true, bool2: false, bool3: true, bool4: false, bool5: true,
            addr1: myAddress(), addr2: myAddress(), addr3: myAddress(),
            cell1: emptyCell(), cell2: emptyCell(),
            slice1: emptyCell().asSlice(), slice2: emptyCell().asSlice(),
            str1: "test1", str2: "test2"
        };
    }
}