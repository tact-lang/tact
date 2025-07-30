struct Mixed {
    intVal: Int;
    optString: String?;
    boolVal: Bool;
    optSlice: Slice?;
    cellVal: Cell;
}

contract Test5 {
    f: Mixed;

    init() {
        self.f = Mixed{
            intVal: 7,
            optString: "hi",
            boolVal: true,
            optSlice: null,
            cellVal: emptyCell(),
        };
    }
}