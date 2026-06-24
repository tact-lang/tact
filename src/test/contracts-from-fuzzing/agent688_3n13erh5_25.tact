struct Ultra {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Address;
    f05: Cell;
    f06: Int?;
    f07: Bool?;
    f08: String?;
    f09: Address?;
    f10: Cell?;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Address;
    f15: Cell;
    f16: Int?;
    f17: Bool?;
    f18: String?;
    f19: Address?;
    f20: Cell?;
    f21: Int;
    f22: Bool;
    f23: String;
    f24: Address;
    f25: Cell;
    f26: Int?;
    f27: Bool?;
    f28: String?;
    f29: Address?;
    f30: Cell?;
    f31: Int;
    f32: Bool;
    f33: String;
    f34: Address;
    f35: Cell;
    f36: Int?;
    f37: Bool?;
    f38: String?;
    f39: Address?;
    f40: Cell?;
    f41: Int;
    f42: Bool;
    f43: String;
    f44: Address;
    f45: Cell;
    f46: Int?;
    f47: Bool?;
    f48: String?;
    f49: Address?;
    f50: Cell?;
    f51: Int;
    f52: Bool;
    f53: String;
    f54: Address;
    f55: Cell;
    f56: Int?;
    f57: Bool?;
    f58: String?;
    f59: Address?;
    f60: Cell?;
    f61: Int;
    f62: Bool;
    f63: String;
    f64: Address;
    f65: Cell;
    f66: Int?;
    f67: Bool?;
    f68: String?;
    f69: Address?;
    f70: Cell?;
    f71: Int;
    f72: Bool;
    f73: String;
    f74: Address;
    f75: Cell;
    f76: Int?;
    f77: Bool?;
    f78: String?;
    f79: Address?;
    f80: Cell?;
}

contract TestContract {
    ultra: Ultra;

    init() {
        self.ultra = Ultra{
            f01:1,f02:true,f03:"a",f04:myAddress(),f05:emptyCell(),
            f06:null,f07:null,f08:null,f09:null,f10:null,
            f11:2,f12:false,f13:"b",f14:myAddress(),f15:emptyCell(),
            f16:null,f17:null,f18:null,f19:null,f20:null,
            f21:3,f22:true,f23:"c",f24:myAddress(),f25:emptyCell(),
            f26:null,f27:null,f28:null,f29:null,f30:null,
            f31:4,f32:false,f33:"d",f34:myAddress(),f35:emptyCell(),
            f36:null,f37:null,f38:null,f39:null,f40:null,
            f41:5,f42:true,f43:"e",f44:myAddress(),f45:emptyCell(),
            f46:null,f47:null,f48:null,f49:null,f50:null,
            f51:6,f52:false,f53:"f",f54:myAddress(),f55:emptyCell(),
            f56:null,f57:null,f58:null,f59:null,f60:null,
            f61:7,f62:true,f63:"g",f64:myAddress(),f65:emptyCell(),
            f66:null,f67:null,f68:null,f69:null,f70:null,
            f71:8,f72:false,f73:"h",f74:myAddress(),f75:emptyCell(),
            f76:null,f77:null,f78:null,f79:null,f80:null
        };
    }
}