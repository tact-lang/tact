struct Combination {
    intv: Int; 
    optint: Int?;
    optstr: String?;
    intval: Int;
    strval: String;
    boolv: Bool; 
}

contract ComboFields {
    rec: Combination;

    init() {
        self.rec = Combination{
            intv: 1,
            optint: null,
            optstr: null,
            intval: 2,
            strval: "ok",
            boolv: true
        };
    }
}