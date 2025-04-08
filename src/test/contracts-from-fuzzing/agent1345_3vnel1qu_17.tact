// Very long contract with 30 fields
contract Huge {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; 
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    f16: String; f17: String; f18: String; f19: String; f20: String;
    f21: Int?; f22: Int?; f23: Bool?; f24: Bool?; f25: String?;
    f26: Int as uint8; f27: Int as uint16; f28: Int as uint32; f29: Int as int64; f30: Int as uint4;

    init() {
        self.f1=1; self.f2=2; self.f3=3; self.f4=4; self.f5=5;
        self.f6=6; self.f7=7; self.f8=8; self.f9=9; self.f10=10;
        self.f11=true; self.f12=false; self.f13=true; self.f14=false; self.f15=true;
        self.f16="a"; self.f17="b"; self.f18="c"; self.f19="d"; self.f20="e";
        self.f21=null; self.f22=null; self.f23=null; self.f24=null; self.f25=null;
        self.f26=26; self.f27=27; self.f28=28; self.f29=29; self.f30=3;
    }
}