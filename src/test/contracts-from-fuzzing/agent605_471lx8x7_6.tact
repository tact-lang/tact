struct Inner {
    val: Int;
    flag: Bool;
}

struct BigOne {
    int1: Int;
    int2: Int;
    int3: Int;
    str1: String;
    str2: String;
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;
    bool1: Bool;
    bool2: Bool;
    innerStruct: Inner;
}

contract TestContract {
    data: BigOne;

    init() {
        self.data = BigOne{
            int1:1, int2:2, int3:3,
            str1:"a", str2:"b",
            addr1:myAddress(), addr2:myAddress(),
            cell1:emptyCell(), cell2:emptyCell(),
            slice1:emptyCell().asSlice(), slice2:emptyCell().asSlice(),
            bool1:true, bool2:false,
            innerStruct: Inner{ val: 10, flag: true }
        };
    }
}