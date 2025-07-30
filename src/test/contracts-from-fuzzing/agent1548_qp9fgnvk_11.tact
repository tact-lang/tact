// Long list of mixed fields
contract LongOne {
    f1: Int; f2: String; f3: Bool;
    f4: Int?; f5: String?; f6: Bool?;
    f7: Int; f8: String; f9: Bool;
    f10: Int?; f11: String?; f12: Bool?;
    f13: Int; f14: String; f15: Bool;

    init() {
        self.f1=0; self.f2=""; self.f3=true;
        self.f4=null; self.f5="txt"; self.f6=null;
        self.f7=7; self.f8="xyz"; self.f9=false;
        self.f10=null; self.f11=null; self.f12=true;
        self.f13=13; self.f14="end"; self.f15=false;
    }
}