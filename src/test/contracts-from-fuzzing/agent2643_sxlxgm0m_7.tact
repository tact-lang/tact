struct Combination {
    intVal: Int;
    intOpt: Int?;
    boolVal: Bool;
    boolOpt: Bool?;
    cellVal: Cell;
    cellOpt: Cell?;
    sliceVal: Slice;
    sliceOpt: Slice?;
    strVal: String;
    strOpt: String?;
}

contract ComboContract {
    data: Combination;

    init() {
        self.data = Combination{
            intVal: 1,
            intOpt: 2,
            boolVal: true,
            boolOpt: false,
            cellVal: emptyCell(),
            cellOpt: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            sliceOpt: emptyCell().asSlice(),
            strVal: "hello",
            strOpt: "world"
        };
    }
}
