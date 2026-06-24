struct OptionalsWide {
    op1: Int?; op2: Int?; op3: Bool?; op4: Bool?; op5: String?;
    op6: String?; op7: Address?; op8: Address?; op9: Cell?; op10: Cell?;
}

contract WideOptionals {
    val: OptionalsWide;

    init() {
        self.val = OptionalsWide{
            op1:null, op2:null, op3:null, op4:null, op5:null,
            op6:null, op7:null, op8:null, op9:null, op10:null
        };
    }
}