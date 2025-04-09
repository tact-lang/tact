struct Combo {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
}

contract OptionalComboStruct {
    combo: Combo;

    init() {
        self.combo = Combo{optInt:null, optBool:null, optAddr:null, optStr:null};
    }

    receive() {
        self.combo = self.combo;
    }
}