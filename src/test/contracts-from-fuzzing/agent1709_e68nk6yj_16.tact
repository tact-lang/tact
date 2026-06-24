struct Tiny {
    flag: Bool;
}

contract ManyTinyStructs {
    a: Tiny;
    b: Tiny;
    c: Tiny;
    d: Tiny;
    e: Tiny;
    init() {
        self.a = Tiny{ flag: true };
        self.b = Tiny{ flag: false };
        self.c = Tiny{ flag: true };
        self.d = Tiny{ flag: false };
        self.e = Tiny{ flag: true };
    }
}