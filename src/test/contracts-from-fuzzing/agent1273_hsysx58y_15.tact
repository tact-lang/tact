struct Mid {
    innerInt: Int;
    optSlice: Slice?;
    strVal: String;
}

contract TestContract {
    m: Mid;
    number: Int;
    flag: Bool?;
    sField: String?;
    cellVal: Cell;

    init() {
        self.m = Mid{
            innerInt: 42,
            optSlice: null,
            strVal: "abc"
        };

        self.number = 7;
        self.flag = null;
        self.sField = null;
        self.cellVal = emptyCell();
    }
}