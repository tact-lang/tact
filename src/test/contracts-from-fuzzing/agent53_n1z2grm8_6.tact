struct Rec {
    num: Int;
    flag: Bool;
}

contract ArrayOfStructs {
    recs1: Rec;
    recs2: Rec;
    recs3: Rec;
    recs4: Rec;
    recs5: Rec;
    recs6: Rec;
    recs7: Rec;

    init() {
        self.recs1 = Rec{ num: 1, flag: true };
        self.recs2 = Rec{ num: 2, flag: false };
        self.recs3 = Rec{ num: 3, flag: true };
        self.recs4 = Rec{ num: 4, flag: false };
        self.recs5 = Rec{ num: 5, flag: true };
        self.recs6 = Rec{ num: 6, flag: false };
        self.recs7 = Rec{ num: 7, flag: true };
    }
}