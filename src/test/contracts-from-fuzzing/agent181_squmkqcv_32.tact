struct BigOpt {
    a1: Int?; a2: Bool?; a3: String?; a4: Address?; a5: Cell?; a6: Slice?;
    a7: Int?; a8: Bool?; a9: String?; a10: Address?; a11: Cell?; a12: Slice?;
    a13: Int?; a14: Bool?; a15: String?; a16: Address?; a17: Cell?; a18: Slice?;
}

contract BigOptVars {
    all: BigOpt;

    init() {
        self.all = BigOpt{
            a1:null,a2:null,a3:null,a4:null,a5:null,a6:null,
            a7:null,a8:null,a9:null,a10:null,a11:null,a12:null,
            a13:null,a14:null,a15:null,a16:null,a17:null,a18:null
        };
    }
}
