struct BoolArray {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
    b11: Bool;
    b12: Bool;
    b13: Bool;
    b14: Bool;
    b15: Bool;
    b16: Bool;
}

contract PackedBools {
    p: BoolArray;

    init() {
        self.p = BoolArray{
            b1:true, b2:true, b3:false, b4:true,
            b5:false, b6:true, b7:false, b8:true,
            b9:true, b10:false, b11:true, b12:true,
            b13:false, b14:true, b15:false, b16:true
        };
    }

    receive() {
        let _ = self.p.b8;
    }
}