struct S {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract TestContract {
    sPersistent: S;

    init() {
        self.sPersistent = S{
            intVal: 123,
            boolVal: false,
            strVal: "test",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}