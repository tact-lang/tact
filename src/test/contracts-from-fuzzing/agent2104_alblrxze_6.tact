struct Tiny {
    flag: Bool;
}

contract ManyFlags {
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
        self.f1 = Tiny{flag: true};
        self.f2 = Tiny{flag: false};
        self.f3 = Tiny{flag: true};
        self.f4 = Tiny{flag: false};
        self.f5 = Tiny{flag: true};
        self.f6 = Tiny{flag: false};
        self.f7 = Tiny{flag: true};
        self.f8 = Tiny{flag: false};
        self.f9 = Tiny{flag: true};
        self.f10 = Tiny{flag: false};
    }
}