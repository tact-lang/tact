struct Mixed {
    val1: Int;
    val2: Int?;
    txt1: String;
    txt2: String?;
    flag1: Bool;
    flag2: Bool?;
    cellOpt: Cell?;
    slOpt: Slice?;
}

contract Test13 {
    m: Mixed;
    init() {
        self.m = Mixed{
            val1: 1,
            val2: null,
            txt1: "hi",
            txt2: null,
            flag1: false,
            flag2: null,
            cellOpt: null,
            slOpt: null
        };
    }
}