struct Combo {
    i: Int;
    b: Bool;
    s: String;
}

contract ComboFields {
    sOpt: Combo?;
    sReg: Combo;

    init() {
        self.sOpt = null;
        self.sReg = Combo{i:5,b:true,s:"hi"};
    }
}