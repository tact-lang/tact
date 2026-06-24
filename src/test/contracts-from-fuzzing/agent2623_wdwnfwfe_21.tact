struct Combo {
    optInt: Int?;
    optBool: Bool?;
    str: String;
    optStr: String?;
    sl: Slice;
    optSlice: Slice?;
    cl: Cell;
    optCell: Cell?;
}

contract TestContract {
    comboField: Combo;

    init() {
        self.comboField = Combo{
            optInt:null,
            optBool:true,
            str: "hi",
            optStr:null,
            sl: emptyCell().asSlice(),
            optSlice:null,
            cl: emptyCell(),
            optCell:null,
        };
    }
}