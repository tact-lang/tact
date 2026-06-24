struct LargeMix {
    int1: Int;
    bool1: Bool;
    addr1: Address;
    string1: String;
    cell1: Cell;
    slice1: Slice;
    builder1: Builder;
    int2: Int;
    bool2: Bool;
    addr2: Address;
    string2: String;
    cell2: Cell;
    slice2: Slice;
    builder2: Builder;
}

contract MixStorage {
    content: LargeMix;

    init() {
        self.content = LargeMix{
            int1:1, bool1:true, addr1:myAddress(), string1:"hi", cell1:emptyCell(), slice1:emptyCell().asSlice(), builder1:beginCell(),
            int2:2, bool2:false, addr2:myAddress(), string2:"bye", cell2:emptyCell(), slice2:emptyCell().asSlice(), builder2:beginCell()
        };
    }
}
