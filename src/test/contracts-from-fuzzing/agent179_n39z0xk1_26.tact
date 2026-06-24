struct Rec {
    count: Int;
    name: String;
}

contract ManyStructs {
    s1: Rec;
    s2: Rec;
    s3: Rec;
    s4: Rec;
    s5: Rec;

    init() {
        self.s1 = Rec{ count:1, name:"a" };
        self.s2 = Rec{ count:2, name:"b" };
        self.s3 = Rec{ count:3, name:"c" };
        self.s4 = Rec{ count:4, name:"d" };
        self.s5 = Rec{ count:5, name:"e" };
    }
}