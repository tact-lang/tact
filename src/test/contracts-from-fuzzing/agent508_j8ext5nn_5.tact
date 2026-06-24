struct BigOpt {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Address?;
    a5: Cell;
    a6: Slice;
    a7: Int;
    a8: Bool;
    a9: String;
    a10: Address?;
    a11: Cell;
    a12: Slice;
    a13: Int;
    a14: Bool;
    a15: String;
    a16: Address?;
    a17: Cell;
    a18: Slice;
    a19: Int;
    a20: Bool;
}

contract TestContract {
    data: BigOpt;
    init() {
        self.data = BigOpt{
            a1:1,a2:true,a3:"s",a4:null,a5:emptyCell(),a6:emptyCell().asSlice(),
            a7:2,a8:false,a9:"t",a10:null,a11:emptyCell(),a12:emptyCell().asSlice(),
            a13:3,a14:true,a15:"r",a16:null,a17:emptyCell(),a18:emptyCell().asSlice(),
            a19:4,a20:false
        };
    }
}