struct Tiny {
    a: Int;
}

contract ManyFields {
    f1: Tiny;
    f2: Tiny;
    f3: Tiny;
    f4: Tiny;
    f5: Tiny;

    init() {
        self.f1 = Tiny{ a:1 };
        self.f2 = Tiny{ a:2 };
        self.f3 = Tiny{ a:3 };
        self.f4 = Tiny{ a:4 };
        self.f5 = Tiny{ a:5 };
    }
}
