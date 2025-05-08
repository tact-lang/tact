struct Pair {
    fst: Int;
    snd: Int;
}

contract TenPairs {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;
    p5: Pair;
    p6: Pair;
    p7: Pair;
    p8: Pair;
    p9: Pair;
    p10: Pair;

    init() {
        self.p1 = Pair{fst: 1, snd: 2};
        self.p2 = Pair{fst: 3, snd: 4};
        self.p3 = Pair{fst: 5, snd: 6};
        self.p4 = Pair{fst: 7, snd: 8};
        self.p5 = Pair{fst: 9, snd: 10};
        self.p6 = Pair{fst: 11, snd: 12};
        self.p7 = Pair{fst: 13, snd: 14};
        self.p8 = Pair{fst: 15, snd: 16};
        self.p9 = Pair{fst: 17, snd: 18};
        self.p10 = Pair{fst: 19, snd: 20};
    }

    receive() {
        self.p1 = self.p1;
    }
}