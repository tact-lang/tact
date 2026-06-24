// extremely long list of primitives in contract persistent state
contract ManyFields {
    f1: Int; f2: Bool; f3: Int; f4: Bool; f5: Int;
    f6: Bool; f7: Int; f8: Bool; f9: Int; f10: Bool;
    f11: Int; f12: Bool; f13: Int; f14: Bool; f15: Int;
    f16: Bool; f17: Int; f18: Bool; f19: Int; f20: Bool;
    f21: Int; f22: Bool; f23: Int; f24: Bool; f25: Int;
    f26: Bool; f27: Int; f28: Bool; f29: Int; f30: Bool;

    init() {
        self.f1=1; self.f2=true; self.f3=2; self.f4=false; self.f5=3;
        self.f6=true; self.f7=4; self.f8=false; self.f9=5; self.f10=true;
        self.f11=6; self.f12=false; self.f13=7; self.f14=true; self.f15=8;
        self.f16=false; self.f17=9; self.f18=true; self.f19=10; self.f20=false;
        self.f21=11; self.f22=true; self.f23=12; self.f24=false; self.f25=13;
        self.f26=true; self.f27=14; self.f28=false; self.f29=15; self.f30=true;
    }
}