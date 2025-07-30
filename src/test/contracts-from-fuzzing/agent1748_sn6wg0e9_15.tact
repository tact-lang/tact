struct LotOfBools {
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    b6: Bool; b7: Bool; b8: Bool; b9: Bool; b10: Bool;
    b11: Bool; b12: Bool; b13: Bool; b14: Bool; b15: Bool;
    b16: Bool; b17: Bool; b18: Bool; b19: Bool; b20: Bool;
}

contract TestContract {
    data: LotOfBools;

    init() {
        self.data = LotOfBools{
            b1:true, b2:false, b3:true, b4:false, b5:true,
            b6:true, b7:false, b8:true, b9:false, b10:true,
            b11:true, b12:false, b13:true, b14:false, b15:true,
            b16:true, b17:false, b18:true, b19:false, b20:true
        };
    }
}