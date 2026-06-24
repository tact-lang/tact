struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract Everything {
    m: Mix;

    init() {
        self.m = Mix{
            intVal: 5,
            boolVal: true,
            strVal: "cool",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            optInt: null,
            optBool: false,
            optString: null,
            optCell: null,
            optSlice: null
        };
    }
}