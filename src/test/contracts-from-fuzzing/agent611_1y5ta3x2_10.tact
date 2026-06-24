struct BigS {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address?;
    f5: Cell;
    f6: Slice;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Address?;
    f11: Cell;
    f12: Slice;
}

contract BigInit {
    state: BigS;

    init() {
        self.state = BigS{
            f1:1, f2:true, f3:"hi", f4:null, f5:emptyCell(), f6:emptyCell().asSlice(),
            f7:2, f8:false, f9:"yo", f10:null, f11:emptyCell(), f12:emptyCell().asSlice()
        };
    }
}