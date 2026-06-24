struct Tiny {
    bit: Bool;
}

contract ManyTiny {
    f1: Tiny;
    f2: Tiny;
    f3: Tiny;
    f4: Tiny;
    f5: Tiny;
    f6: Tiny;
    f7: Tiny;
    f8: Tiny;
    f9: Tiny;
    f10: Tiny;
    
    init() {
        self.f1 = Tiny{bit: false};
        self.f2 = Tiny{bit: false};
        self.f3 = Tiny{bit: false};
        self.f4 = Tiny{bit: false};
        self.f5 = Tiny{bit: false};
        self.f6 = Tiny{bit: false};
        self.f7 = Tiny{bit: false};
        self.f8 = Tiny{bit: false};
        self.f9 = Tiny{bit: false};
        self.f10 = Tiny{bit: false};
    }
}