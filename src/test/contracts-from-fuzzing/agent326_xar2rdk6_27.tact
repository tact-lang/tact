contract LargeBoolBlock {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
    f11: Bool;
    f12: Bool;
    f13: Bool;
    f14: Bool;
    f15: Bool;

    init() {
        self.f1=true; self.f2=false; self.f3=true;
        self.f4=false; self.f5=true; self.f6=false;
        self.f7=true; self.f8=false; self.f9=true;
        self.f10=false; self.f11=true; self.f12=false;
        self.f13=true; self.f14=false; self.f15=true;
    }

    receive() {
        self.f1 = self.f1;
    }
}