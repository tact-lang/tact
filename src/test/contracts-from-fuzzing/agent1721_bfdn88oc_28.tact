// Contract with huge amount of primitive + optional persistent variables
contract MaxFieldsStressTest {
    f1: Int;     f2: Int?;
    f3: Int;     f4: Int?;
    f5: Bool;    f6: Bool?;
    f7: Bool;    f8: Bool?;
    f9: String;  f10: String?;
    f11: String; f12: String?;
    f13: Address; f14: Address?;
    f15: Address; f16: Address?;

    init() {
        self.f1=0; self.f2=null;
        self.f3=1; self.f4=null;
        self.f5=true; self.f6=null;
        self.f7=false; self.f8=null;
        self.f9="a"; self.f10=null;
        self.f11="b"; self.f12=null;
        self.f13=myAddress(); self.f14=null;
        self.f15=myAddress(); self.f16=null;
    }
}
