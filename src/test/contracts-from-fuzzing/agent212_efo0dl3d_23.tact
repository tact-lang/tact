struct VeryBig {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    f16: String; f17: String; f18: String; f19: String; f20: String;
    f21: Int; f22: Int; f23: Int; f24: Int; f25: Int; f26: Int; f27: Int; f28: Int; f29: Int; f30: Int;
    f31: Bool; f32: Bool; f33: Bool; f34: Bool; f35: Bool;
    f36: String; f37: String; f38: String; f39: String; f40: String;
    f41: Int; f42: Int; f43: Int; f44: Int; f45: Int; f46: Int; f47: Int; f48: Int; f49: Int; f50: Int;
    f51: Bool; f52: Bool; f53: Bool; f54: Bool; f55: Bool;
    f56: String; f57: String; f58: String; f59: String; f60: String;
}

contract TestContract {
    data: VeryBig;

    init() {
        self.data = VeryBig{
            f1:1, f2:2, f3:3, f4:4, f5:5, f6:6, f7:7, f8:8, f9:9, f10:10,
            f11:true, f12:false, f13:true, f14:false, f15:true,
            f16:"a", f17:"b", f18:"c", f19:"d", f20:"e",
            f21:11, f22:12, f23:13, f24:14, f25:15, f26:16, f27:17, f28:18, f29:19, f30:20,
            f31:false, f32:true, f33:false, f34:true, f35:false,
            f36:"f", f37:"g", f38:"h", f39:"i", f40:"j",
            f41:21, f42:22, f43:23, f44:24, f45:25, f46:26, f47:27, f48:28, f49:29, f50:30,
            f51:true, f52:false, f53:true, f54:false, f55:true,
            f56:"k", f57:"l", f58:"m", f59:"n", f60:"o"
        };
    }
}