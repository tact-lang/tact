struct WideMix {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;
}

contract TestWideMix {
    wide: WideMix;

    init() {
        self.wide = WideMix{
            intVal: 42,
            boolVal: true,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            stringVal: "hello"
        };
    }
}