struct Diverse {
    flag: Bool;
    count: Int;
    dataCell: Cell;
    text: String;
    maybeInt: Int?;
    addr: Address;
    sliceVal: Slice;
    builderVal: Builder;
}

contract DiverseFields {
    val: Diverse;

    init() {
        self.val = Diverse{
            flag: true,
            count: 7,
            dataCell: emptyCell(),
            text: "hi",
            maybeInt: null,
            addr: myAddress(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}