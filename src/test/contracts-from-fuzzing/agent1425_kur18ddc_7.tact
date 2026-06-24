struct Pair { x: Int; y: Int; }

contract TestContract {
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
        self.p1 = Pair{ x:1, y:2 };
        self.p2 = Pair{ x:3, y:4 };
        self.p3 = Pair{ x:5, y:6 };
        self.p4 = Pair{ x:7, y:8 };
        self.p5 = Pair{ x:9, y:10 };
        self.p6 = Pair{ x:11, y:12 };
        self.p7 = Pair{ x:13, y:14 };
        self.p8 = Pair{ x:15, y:16 };
        self.p9 = Pair{ x:17, y:18 };
        self.p10 = Pair{ x:19, y:20 };
    }

    receive() {}
}