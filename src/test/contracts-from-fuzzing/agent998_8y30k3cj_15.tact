struct MultipleTypes {
    intf: Int;
    boolf: Bool;
    strf: String;
    addr: Address;
    cellf: Cell;
    slicev: Slice;
    optint: Int?;
    optstr: String?;
    optaddr: Address?;
}

contract ComboVars {
    multi: MultipleTypes;

    init() {
        self.multi = MultipleTypes{
            intf:1,
            boolf:true,
            strf:"hello",
            addr:myAddress(),
            cellf:emptyCell(),
            slicev:emptyCell().asSlice(),
            optint: null,
            optstr: null,
            optaddr: null
        };
    }
}