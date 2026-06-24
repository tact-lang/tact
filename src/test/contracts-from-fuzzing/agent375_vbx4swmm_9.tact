struct ManyBools {
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
    b17: Bool;
    b18: Bool;
    b19: Bool;
    b20: Bool;
    b21: Bool;
    b22: Bool;
    b23: Bool;
    b24: Bool;
    b25: Bool;
    b26: Bool;
    b27: Bool;
    b28: Bool;
    b29: Bool;
    b30: Bool;
    b31: Bool;
    b32: Bool;
    b33: Bool;
    b34: Bool;
    b35: Bool;
    b36: Bool;
    b37: Bool;
    b38: Bool;
    b39: Bool;
    b40: Bool;
    b41: Bool;
    b42: Bool;
    b43: Bool;
    b44: Bool;
    b45: Bool;
    b46: Bool;
    b47: Bool;
    b48: Bool;
    b49: Bool;
    b50: Bool;
}

contract TestContract {
    data: ManyBools;

    init() {
        self.data = ManyBools{
            b1:true,b2:false,b3:true,b4:false,b5:true,b6:false,b7:true,b8:false,b9:true,b10:false,
            b11:true,b12:false,b13:true,b14:false,b15:true,b16:false,b17:true,b18:false,b19:true,b20:false,
            b21:true,b22:false,b23:true,b24:false,b25:true,b26:false,b27:true,b28:false,b29:true,b30:false,
            b31:true,b32:false,b33:true,b34:false,b35:true,b36:false,b37:true,b38:false,b39:true,b40:false,
            b41:true,b42:false,b43:true,b44:false,b45:true,b46:false,b47:true,b48:false,b49:true,b50:false,
        };
    }

    receive() {
        let _ = self.data;
    }
}