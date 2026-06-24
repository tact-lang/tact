struct ComplexTypes {
    intf: Int;
    boolf: Bool;
    strf: String;
    addr: Address;
    cellf: Cell;
    slice: Slice;
}

contract TestContract {
    cx: ComplexTypes;
    init() {
        self.cx = ComplexTypes{
            intf:123,
            boolf:false,
            strf:"str",
            addr:myAddress(),
            cellf:beginCell().endCell(),
            slice:beginCell().endCell().asSlice()
        };
    }
}