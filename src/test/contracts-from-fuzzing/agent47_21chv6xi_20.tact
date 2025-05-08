// massive struct with 30 fields of different types + optionals
struct Massive {
    f1: Int; f2: Int; f3: Bool; f4: Bool; f5: String;
    f6: String; f7: Int?; f8: Bool?; f9: String?; f10: Int;
    f11: Int; f12: Bool; f13: Bool; f14: String; f15: String;
    f16: Int?; f17: Bool?; f18: String?; f19: Int; f20: Int;
    f21: Bool; f22: Bool; f23: String; f24: String; f25: Int?;
    f26: Bool?; f27: String?; f28: Int; f29: Bool; f30: String;
}

contract MegaStorage {
    data: Massive;

    init() {
        self.data = Massive{
            f1:1,f2:2,f3:true,f4:false,f5:"a",
            f6:"b",f7:null,f8:true,f9:"c",f10:10,
            f11:11,f12:true,f13:false,f14:"d",f15:"e",
            f16:null,f17:null,f18:null,f19:19,f20:20,
            f21:false,f22:true,f23:"f",f24:"g",f25:null,
            f26:null,f27:null,f28:28,f29:true,f30:"z"
        };
    }
}