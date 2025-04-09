struct Bundle {
    int1: Int;
    int2: Int?;
    bool1: Bool;
    bool2: Bool?;
    str1: String;
    str2: String?;
    cell1: Cell;
    cell2: Cell?;
    slice1: Slice;
    slice2: Slice?;
    address1: Address;
    address2: Address?;
}

contract ComboStruct {
    bundle: Bundle;
    init() {
        self.bundle = Bundle{
            int1:1,
            int2:null,
            bool1:true,
            bool2:false,
            str1:"hi",
            str2:null,
            cell1:emptyCell(),
            cell2:null,
            slice1:emptyCell().asSlice(),
            slice2:null,
            address1:myAddress(),
            address2:null
        };
    }
}