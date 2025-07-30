struct Rec {
    num: Int;
    txt: String;
}

contract ManyStructVars {
    s1: Rec;
    s2: Rec;
    s3: Rec;

    init() {
        self.s1 = Rec{num: 1, txt: "a"};
        self.s2 = Rec{num: 2, txt: "b"};
        self.s3 = Rec{num: 3, txt: "c"};
    }
}