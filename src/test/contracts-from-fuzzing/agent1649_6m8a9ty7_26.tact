struct Large {
    f1: Int;  f2: Bool; f3: String;
    f4: Int;  f5: Bool; f6: String;
    f7: Int;  f8: Bool; f9: String;
    f10: Int; f11: Bool; f12: String;
    f13: Int; f14: Bool; f15: String;
    f16: Int; f17: Bool; f18: String;
    f19: Int; f20: Bool; f21: String;
    f22: Int; f23: Bool; f24: String;
    f25: Int; f26: Bool; f27: String;
    f28: Int; f29: Bool; f30: String;
    f31: Int; f32: Bool; f33: String;
    f34: Int; f35: Bool; f36: String;
    f37: Int; f38: Bool; f39: String;
    f40: Int; f41: Bool; f42: String;
}

contract TestContract {
    data: Large;
    init() {
        self.data = Large{
            f1:1, f2:true, f3:"a",
            f4:2, f5:false, f6:"b",
            f7:3, f8:true, f9:"c",
            f10:4,f11:false,f12:"d",
            f13:5,f14:true,f15:"e",
            f16:6,f17:false,f18:"f",
            f19:7,f20:true,f21:"g",
            f22:8,f23:false,f24:"h",
            f25:9,f26:true,f27:"i",
            f28:10,f29:false,f30:"j",
            f31:11,f32:true,f33:"k",
            f34:12,f35:false,f36:"l",
            f37:13,f38:true,f39:"m",
            f40:14,f41:false,f42:"n",
        };
    }
}