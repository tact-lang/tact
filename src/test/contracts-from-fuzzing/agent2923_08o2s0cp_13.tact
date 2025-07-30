struct Mix {
    intVal: Int;
    optBool: Bool?;
    strVal: String;
    optAddress: Address?;
    cellVal: Cell;
    optSlice: Slice?;
}

contract MixedStructContract {
    data: Mix;

    init() {
        self.data = Mix{
            intVal:42,
            optBool:null,
            strVal:"str",
            optAddress:null,
            cellVal:emptyCell(),
            optSlice:null
        };
    }
}