struct Inner {
    value: Int;
    comment: String?;
}

struct Mid {
    left: Inner;
    right: Inner?;
}

contract WideContract {
    m1: Mid; m2: Mid; m3: Mid; m4: Mid; m5: Mid;
    m6: Mid; m7: Mid; m8: Mid; m9: Mid; m10: Mid;
    
    init() {
        let def = Mid{ left: Inner{ value: 1, comment: null }, right: null };
        self.m1=def; self.m2=def; self.m3=def; self.m4=def; self.m5=def;
        self.m6=def; self.m7=def; self.m8=def; self.m9=def; self.m10=def;
    }
}