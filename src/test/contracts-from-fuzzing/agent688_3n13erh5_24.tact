struct Mega {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Address;
    a5: Cell;
    a6: Int?;
    a7: Bool?;
    a8: String?;
    a9: Address?;
    a10: Cell?;
    a11: Int;
    a12: Bool;
    a13: String;
    a14: Address;
    a15: Cell;
    a16: Int?;
    a17: Bool?;
    a18: String?;
    a19: Address?;
    a20: Cell?;
    a21: Int;
    a22: Bool;
    a23: String;
    a24: Address;
    a25: Cell;
    a26: Int?;
    a27: Bool?;
    a28: String?;
    a29: Address?;
    a30: Cell?;
    a31: Int;
}

contract TestContract {
    big: Mega;

    init() {
        self.big = Mega{
            a1:1,a2:true,a3:"x",a4:myAddress(),a5:emptyCell(),
            a6:null,a7:null,a8:null,a9:null,a10:null,
            a11:2,a12:false,a13:"y",a14:myAddress(),a15:emptyCell(),
            a16:null,a17:null,a18:null,a19:null,a20:null,
            a21:3,a22:true,a23:"z",a24:myAddress(),a25:emptyCell(),
            a26:null,a27:null,a28:null,a29:null,a30:null,
            a31:4
        };
    }
}