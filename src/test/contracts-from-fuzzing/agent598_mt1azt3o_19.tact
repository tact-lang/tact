struct SubData {
    info: String;
    refCell: Cell;
}

struct CompositeData {
    addr: Address;
    codeCell: Cell;
    dataSlice: Slice;
    nested: SubData;
}

contract MultiComplex {
    mixt: CompositeData;

    init() {
        self.mixt = CompositeData{
            addr: myAddress(),
            codeCell: emptyCell(),
            dataSlice: emptyCell().asSlice(),
            nested: SubData{
                info: "hi",
                refCell: emptyCell()
            }
        };
    }
}