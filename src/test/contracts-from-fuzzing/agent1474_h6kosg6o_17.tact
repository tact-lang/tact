struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract ComboTester {
    combo: Combo;

    init() {
        self.combo = Combo{
            intVal: 1,
            boolVal: false,
            strVal: "hi",
            intOpt: null,
            boolOpt: null,
            strOpt: null
        };
    }
}
