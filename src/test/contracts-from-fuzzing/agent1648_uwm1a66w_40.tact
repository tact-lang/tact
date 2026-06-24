struct Rec {
    x: Int;
}

contract ManyStructs {
    s1: Rec;
    s2: Rec;
    s3: Rec;
    s4: Rec;

    init() {
        self.s1 = Rec{ x:1 };
        self.s2 = Rec{ x:2 };
        self.s3 = Rec{ x:3 };
        self.s4 = Rec{ x:4 };
    }
}