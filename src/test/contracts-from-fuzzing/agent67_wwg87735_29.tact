// contract with >20 persistent fields inline
contract HugeContract {
    f01: Int;
    f02: Bool;
    f03: Int?;
    f04: Bool?;
    f05: String;
    f06: Int;
    f07: Bool;
    f08: Int?;
    f09: Bool?;
    f10: String;
    f11: Int;
    f12: Bool;
    f13: Int?;
    f14: Bool?;
    f15: String;
    f16: Int;
    f17: Bool;
    f18: Int?;
    f19: Bool?;
    f20: String;
    f21: Int;

    init() {
        self.f01=1; self.f02=true; self.f03=null; self.f04=false; self.f05="s";
        self.f06=6; self.f07=false; self.f08=8; self.f09=null; self.f10="ten";
        self.f11=11; self.f12=true; self.f13=null; self.f14=true; self.f15="fifteen";
        self.f16=16; self.f17=false; self.f18=null; self.f19=true; self.f20="twenty";
        self.f21=21;
    }
}
