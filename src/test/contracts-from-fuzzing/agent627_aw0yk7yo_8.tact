struct ManyFields {
    f1: Int; f2: Bool; f3: String; f4: Address; f5: Cell;
    f6: Int; f7: Bool; f8: String; f9: Address; f10: Cell;
    f11: Int; f12: Bool; f13: String; f14: Address; f15: Cell;
    f16: Int; f17: Bool; f18: String; f19: Address; f20: Cell;
}

contract TestContract {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            f1:1,f2:true,f3:"",f4:myAddress(),f5:emptyCell(),
            f6:2,f7:false,f8:"",f9:myAddress(),f10:emptyCell(),
            f11:3,f12:true,f13:"",f14:myAddress(),f15:emptyCell(),
            f16:4,f17:false,f18:"",f19:myAddress(),f20:emptyCell()
        };
    }
}