struct Tiny {
    f: Bool;
}

contract ManyBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    nested: Tiny;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.b5 = true;
        self.nested = Tiny{ f: true };
    }
}
