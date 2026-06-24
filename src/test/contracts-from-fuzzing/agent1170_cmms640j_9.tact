struct MultiPrimitive {
    num: Int;
    text: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
    builder: Builder;
    flag: Bool;
}

contract DiverseFields {
    data: MultiPrimitive;

    init() {
        self.data = MultiPrimitive{
            num: 1,
            text: "abc",
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell(),
            flag: true
        };
    }
}
