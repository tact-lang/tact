struct Wrap {
    intf: Int;
    boolf: Bool;
    stringf: String;
    cellf: Cell;
    sliceF: Slice;
    addrF: Address;
}

contract AllTypes {
    data: Wrap;

    init() {
        self.data = Wrap{
            intf:1, boolf:true, stringf:"abc", cellf:emptyCell(), sliceF:emptyCell().asSlice(), addrF:myAddress()
        };
    }
}