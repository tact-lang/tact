struct Tiny {
    one: Int;
}

contract Arrayish {
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
        self.f1 = Tiny{ one:1 };
        self.f2 = Tiny{ one:2 };
        self.f3 = Tiny{ one:3 };
        self.f4 = Tiny{ one:4 };
        self.f5 = Tiny{ one:5 };
        self.f6 = Tiny{ one:6 };
        self.f7 = Tiny{ one:7 };
        self.f8 = Tiny{ one:8 };
        self.f9 = Tiny{ one:9 };
        self.f10 = Tiny{ one:10 };
    }
}