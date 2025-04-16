struct Huge {
    f1: Int; f2: Int; f3: Int; f4: Bool; f5: String;
    f6: Int; f7: Int; f8: Int; f9: Bool; f10: String;
    f11: Int; f12: Int; f13: Int; f14: Bool; f15: String;
    f16: Int; f17: Int; f18: Int; f19: Bool; f20: String;
    f21: Int; f22: Int; f23: Int; f24: Bool; f25: String;
    f26: Int; f27: Int; f28: Int; f29: Bool; f30: String;
    f31: Int; f32: Int; f33: Int; f34: Bool; f35: String;
    f36: Int; f37: Int; f38: Int; f39: Bool; f40: String;
    f41: Int; f42: Int; f43: Int; f44: Bool; f45: String;
    f46: Int; f47: Int; f48: Int; f49: Bool; f50: String;
}

contract HugeStructStorage {
    payload: Huge;

    init() {
        self.payload = Huge{
            f1:1, f2:2, f3:3, f4:true, f5:"a",
            f6:6, f7:7, f8:8, f9:false, f10:"b",
            f11:11, f12:12, f13:13, f14:true, f15:"c",
            f16:16, f17:17, f18:18, f19:false, f20:"d",
            f21:21, f22:22, f23:23, f24:true, f25:"e",
            f26:26, f27:27, f28:28, f29:false, f30:"f",
            f31:31, f32:32, f33:33, f34:true, f35:"g",
            f36:36, f37:37, f38:38, f39:false, f40:"h",
            f41:41, f42:42, f43:43, f44:true, f45:"i",
            f46:46, f47:47, f48:48, f49:false, f50:"j"
        };
    }
}